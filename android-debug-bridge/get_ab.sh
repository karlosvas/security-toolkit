#!/bin/bash

# Verificar si ADB está instalado
if ! command -v adb &> /dev/null; then
    echo "ADB no está instalado. Por favor, instálalo y vuelve a intentarlo."
    exit 1
fi

# Verificar que el dispositivo está conectado
echo "Verificando dispositivos conectados..."
adb devices

# Esperar unos segundos para asegurar conexión
sleep 2

# Comprobar si ADB detecta el dispositivo
if ! adb get-state > /dev/null 2>&1; then
    echo "No se detectó ningún dispositivo ADB. Conecta tu dispositivo e intenta de nuevo."
    exit 1
fi

# Crear carpeta para el backup
BACKUP_DIR="./.$(date +%Y%m%d_%H%M%S)"
echo "Cargando: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

if [ $? -ne 0 ]; then
    echo "Error al crear la carpeta de"
    exit 1
fi

# Función para realizar la copia y manejar errores
backup_data() {
    local source=$1
    local destination=$2
    echo "Copiando $source a $destination..."
    adb pull "$source" "$destination"
    if [ $? -ne 0 ]; then
        echo "Error al copiar $source a $destination"
    else
        echo "Copia de $source a $destination completada"
    fi
}

# Copiar carpetas importantes
backup_data /sdcard/DCIM "$BACKUP_DIR/DCIM"       # Fotos y videos
backup_data /sdcard/Download "$BACKUP_DIR/Download"  # Archivos descargados
backup_data /sdcard/Documents "$BACKUP_DIR/Documents"  # Documentos
backup_data /sdcard/WhatsApp "$BACKUP_DIR/WhatsApp"  # Datos de WhatsApp
backup_data /sdcard/Pictures "$BACKUP_DIR/Pictures"  # Imágenes
backup_data /sdcard/Music "$BACKUP_DIR/Music"      # Música
backup_data /sdcard/Movies "$BACKUP_DIR/Movies"     # Videos guardados
backup_data /data/data/com.android.providers.contacts/databases/contacts2.db "$BACKUP_DIR/contacts.db" # Contactos

echo "success"
