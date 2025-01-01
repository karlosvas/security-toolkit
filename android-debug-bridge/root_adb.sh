#!/bin/bash

# Variables
TWRP_IMG="twrp.img"  # Ruta al archivo TWRP
MAGISK_ZIP="Magisk.zip"  # Ruta al archivo Magisk ZIP

# Comprobación de dispositivos conectados
echo "Comprobando dispositivos conectados..."
adb devices
if [ $? -ne 0 ]; then
    echo "No se detectó un dispositivo. Conecta tu dispositivo y habilita la depuración USB."
    exit 1
fi

# Desbloquear el bootloader (esto borra los datos, ten en cuenta que necesitarás una copia de seguridad)
echo "Desbloqueando el bootloader..."
adb reboot bootloader
fastboot oem unlock || fastboot flashing unlock
if [ $? -ne 0 ]; then
    echo "Error al desbloquear el bootloader. Asegúrate de que tu dispositivo sea compatible."
    exit 1
fi

# Instalar TWRP
echo "Flasheando TWRP..."
fastboot flash recovery $TWRP_IMG
if [ $? -ne 0 ]; then
    echo "Error al flashear TWRP. Asegúrate de que el archivo TWRP sea compatible."
    exit 1
fi

# Reiniciar en modo TWRP
echo "Reiniciando en TWRP..."
fastboot boot $TWRP_IMG
sleep 10  # Espera a que TWRP inicie

# Flashear Magisk
echo "Flasheando Magisk..."
adb push $MAGISK_ZIP /sdcard/
adb shell "twrp install /sdcard/$MAGISK_ZIP"
if [ $? -ne 0 ]; then
    echo "Error al flashear Magisk."
    exit 1
fi

# Reiniciar el sistema
echo "Root completado, reiniciando el sistema..."
adb reboot

echo "Proceso finalizado con éxito. El dispositivo debería estar rooteado ahora."
exit 0
