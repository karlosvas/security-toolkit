#!/bin/bash

# Definir colores
GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"
CYAN="\e[36m"
YELLOW="\e[33m"

# Función para mostrar mensajes en verde
print_green() {
    echo -e "${GREEN}$1${RESET}"
}

# Función para mostrar mensajes en rojo
print_red() {
    echo -e "${RED}$1${RESET}"
}

# Función para mostrar mensajes en cian
print_cyan() {
    echo -e "${CYAN}$1${RESET}"
}

# Función para mostrar mensajes en amarillo
print_yellow() {
    echo -e "${YELLOW}$1${RESET}"
}