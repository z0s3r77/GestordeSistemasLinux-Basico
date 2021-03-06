#!/bin/bash 

if [ $(whoami) != "root" ]; then
    echo "Tienes que ser root para ejecutar este script"
    echo "Ejecuta "sudo" delante del archivo .sh para iniciarlo como root"
    echo "Cuidado con lo que ejecutas"
    exit 1
fi

while [ "$seleccion" != "0" ]
do
clear
echo "-------------------------"
echo "Gestor de Sistemas  by Zoser777"
echo "       "
echo "Elija el numero de la opcion que quiera usar"
echo "    "
echo "1.Gestion de usuarios"
echo "2.Gestion de programas con Snap"
echo "3.Gestion de prorgramas con Dpkg (en desarrollo)"
echo "4.Gestion de programas con apt (en desarrollo)"
echo "-------------------------"
echo "0.Salir"

read seleccion
case $seleccion in 

1)	clear
	echo "Gestion de Usuarios"
	echo "------------------------"
	echo "Elija el numero de la opcion que quiera usar"
	echo "1.Crear usuario"
	echo "2.Crear o modificar contraseña a un usuario"
	echo "3.Crear un grupo"
	echo "4.Añadir a un grupo un usuario"
	echo "5.Ver información de un usuario"
	echo "6.Borrar un usuario"
	echo "7.Borrar un grupo"
	echo  " "
	echo "ENTER para retroceder"
	read seleccion1
	
	case $seleccion1 in 
	
	1)echo "Como se llamara el nuevo usuario:"
	read Nusuario           #Nuevo usuario
	adduser $Nusuario;;

	2)echo "Nombre de usuario para cambiarle la contraseña"
	read  Musuario         #Modificar usuario
	passwd $Musuario;;

	3)echo "Como se llamara el nuevo grupo:"
	read Ngrupo            #Nuevo grupo
	groupadd $Ngrupo;;

	4)echo "Como se llama el usuario:"
	read AUsuario          #Añadir usuario a un grupo
	echo "A que grupo lo quieres añadir:"
	read Gañadido          #Grupo al que se va añadir el usuario
	sudo addgroup $AUsuario $Gañadido;;

	5)echo "De que usuario quieres ver los datos:"
	read Iusuario          #Informacion del usuario
	id $Iusuario;;

	6)echo "Que usuario quieres borrar:"
	read Busuario         #Borrar usuario
	deluser $Busuario;;

	7)echo "Que grupo quieres borrar:"
	read Bgrupo
	delgroup $Bgrupo;;

	8)echo "Que programa quieres instalar: (escribelo en minusculas)"
	read programa        #Programa a instalar
	snap install $programa;;
	esac;;


2)	clear
	echo "Gestion de Programas con Snap"
	echo "-----------------------------"
	echo "1. Instalar paquete: (escribelo en minusculas)"
	echo "2. Eliminar paquete : (escribelo en minusculas)"
	echo "3. Actualizar snaps"
	echo "4. Listar paquetes descargados con snap"
	echo "5. Listar paquetes instalados con snap"
	echo "6. Buscar snap"
	echo "7. Revertir programa"
	echo "    "
	echo "ENTER para retroceder"
	read seleccion2 
	case $seleccion2 in
	1)echo "Que paquete quieres intalar"
	read programa        #Programa a instalar
        snap install $programa;;
	2)echo "Que paquete quieres eliminar: (escribelo en minusculas)"
	read programa1    #programa a desinstalar  
	snap remove $programa1;;
	3)echo "Realizando actualizacion de snaps..."
	 snap refresh;;
	## (if [ $var1 -eq 0 ]; then echo OK else echo FAIL fi)
	4)echo "Paquetes descargados"
	ls /var/lib/snapd/snaps 
	read a;;
	5)echo "Paquetes instalados"
	snap list
	read a;;
	6)echo "Como se llama el nombre del paquete:"
	read b 
	snap find $b
	read a;;
	7)echo "Que paquetes quieres revertir:"
	read c
	snap refresh $c;;
	esac;;

3)	clear 
	echo "Gestion de paquetes con Dpkg (en desarrollo) "
	echo "------------------------------"
	echo "1.Instalar paquete con Dpkg (escribelo en minusculas)"
	echo "2.Eliminar paquete con Dpkg (escribelo en minusculas)"
	echo "3.Purgar paquete con Dpkg (elimina los datos de configuración)"
        echo "    "
	echo "ENTER para retroceder"
	read seleccion3
	case $seleccion3 in
        1)echo "Que paquete quieres instalar con Dpkg:"
        read programa3        #Programa a instalar
        dpkg -i $programa3;;
        2)echo "Que program quieres eliminar con Dpkg:"
        read programa4    #programa a desinstalar
	dpkg -r $programa4;;  
        esac;;

4)	clear 
	echo "Gestion de paquetes con apt (en desarrollo)"
	echo "-----------------------------"
	echo "1. Instalar paquete con apt" 
	echo "2. Eliminar paquete con apt"
	echo "3. Actualizar paquetes con apt"
	echo "4. Borrar paquete con apt"
	echo "5. Limpiar disco duro de paquetes"
	echo "6. Actualizar distribucion"
	echo "   "
	echo "ENTER para retroceder"

	read seleccion4
	case $seleccion4 in 
	1)echo "Que paquete quieres instalar con apt:"
	read yy
	apt install $yy;;
	2)echo "Que paquete quieres eliminar con apt:" 
	read xx
	apt remove $xx;;
	esac;;

esac  #Para cerrar el case 
done  
exit 0 #Para cerrar el gestor indicamos 0

#Mirar como volver atras en cada punto. Es decir si me meto en el punto dos, poder volver al
#menu principal y poder volver a entrar
