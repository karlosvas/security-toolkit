#!/bin/bash

# Verificar si localtunnel está instalado
if ! command -v lt &> /dev/null
then
    echo "localtunnel no está instalado, dependencias(npm). Instalando..."
    sudo npm install -g localtunnel
fi

# Cerrar cualquier proceso que esté utilizando el puerto 4444
echo "Cerrando procesos en el puerto 4444..."
sudo fuser -k 4444/tcp

# Ejecutar localtunnel
lt --port 4444 --subdomain metasploit