#INICIALIZADOR


############################## CONSTANTES ###################################

#Declaro el PATH donde se debe trabajar SIEMPRE
GRUPO=`pwd`"/Grupo01/"

#Declaro subdirectorio dirconf (RESERVADO)
DIRCONF="$GRUPO""dirconf/"

#PATH al archivo de config
ARCHCONF="$DIRCONF""arch.conf"

##############################################################################

############################# PROCEDIMIENTOS #################################
setearAmbiente(){
	while read linea; do
		VAR=`echo $linea | sed 's-^\([^=]*\)=.*-\1-'`
		DIR=`echo $linea | sed 's-^[^=]*=\([^=]*\)=.*-\1-'`
		
	done < "$ARCHCONF"
}




##############################################################################

################################### MAIN ####################################

if [ -e "$ARCHCONF" ]; then
	setearAmbiente
else
	echo "EL SISTEMA NO ESTA INSTALADO"
	echo "Por favor, instalarlo de la siguiente manera:"
	echo "./instalador -i"
	exit 0
fi