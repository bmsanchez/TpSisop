#INTALADOR

############################## CONSTANTES ###################################

#Declaro el PATH donde se debe trabajar SIEMPRE
GRUPO=`pwd`"/Grupo01/"

#Declaro subdirectorio dirconf (RESERVADO)
DIRCONF="$GRUPO""dirconf"

#Declaro subdirectorio ejecutable (DEFAULT)
DIRBIN="$GRUPO""bin/"

#Declaro subdirectorio maestros (DEFAULT)
DIRMA="$GRUPO""maestros/"

#Declaro subdirectorio novedades (DEFAULT)
DIRNOV="$GRUPO""novedades/"

#Declaro subdirectorio aceptados (DEFAULT)
DIRACE="$GRUPO""aceptados/"

#Declaro subdirectorio rechazados (DEFAULT)
DIRREJ="$GRUPO""rechazados/"

#Declaro subdirectorio validados (DEFAULT)
DIRVAL="$GRUPO""validados/"

#Declaro subdirectorio de reporte (DEFAULT)
DIRREP="$GRUPO""reportes/"

#Declaro subdirectorio log (DEFAULT)
DIRLOG="$GRUPO""log/"

##############################################################################

############################# PROCEDIMIENTOS #################################
chequeoPerl(){

	echo "Chequeando Perl..."
	echo
	#Con el primer comando me quedo con la segunda linea de perl -v
	#Con el segundo me quedo con la version
	PERLV=`perl -v | sed -e 2b -e '$!d'`
	VERSION=`echo "$PERLV" | sed 's/^.*perl\ \([0-9]\).*$/\1/g'`

	if [ "$VERSION" -lt "5" ]; then
		echo "Debe instalar Perl 5 o superior"
		echo
	else
		echo "Perl 5 o superior instalado"
		echo
	fi

}

definirNombresDirectorios(){

	echo "A continuacion, ingrese los nombres de los directorios sin '/'."
	echo "En caso de desear el de DEFAULT, presionar ENTER."
	echo

	CORTE=false

	while [ "$CORTE" = false ]; do

		echo "DIRECTORIO PARA EJECUTABLES"
		echo "DEFAULT $DIRBIN"
		echo
		read INPUT
		if [ "$INPUT" != "dirconf" ] && [ "$INPUT" != "" ] && [ ! -e "$GRUPO$INPUT/" ] ; then
			CORTE=true
			DIRBIN="$GRUPO""$INPUT""/"
		else
			echo
			echo "DIRECTORIO INCORRECTO!!!!!"
			echo "Verifique que el nombre no sea: "
			echo "Duplicado, vacio o igual a \"dircof\""
			echo
		fi

	done


}



##############################################################################

################################### MAIN ####################################

if [ "$1" = "-t" ]; then

	if [ -s "$DIRCONF" ]; then
		echo "Archivo $DIRCONF:"
		echo
		cat "$DIRCONF"
		echo
	else
		echo "El sistema no está instalado"
		echo
	fi
	
fi

chequeoPerl

definirNombresDirectorios




##############################################################################