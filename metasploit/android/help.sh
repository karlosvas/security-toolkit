#!/bin/bash

# Definir colores
GREEN="\e[32m"
CYAN="\e[36m"
YELLOW="\e[33m"
RESET="\e[0m"

# Función para mostrar mensajes en verde
print_green() {
    echo -e "${GREEN}$1${RESET}"
}

# Función para mostrar mensajes en cian
print_cyan() {
    echo -e "${CYAN}$1${RESET}"
}

# Función para mostrar mensajes en amarillo
print_yellow() {
    echo -e "${YELLOW}$1${RESET}"
}

# Mostrar el menú de ayuda
print_cyan "\t=============================="
print_green "\t          AYUDA"
print_cyan "\t=============================="
print_yellow "\t1. Crear el payload"
print_green "\t   sudo bash payload.sh"
print_yellow "\t2. Configurar msfconsole"
print_green "\t   sudo bash config.sh"
print_yellow "\t3. Crear persistencia"
print_yellow "\t   y obtener datos"
print_green "\t   sudo bash get.sh"
print_cyan "\t=============================="