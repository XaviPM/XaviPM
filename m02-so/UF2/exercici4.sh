cd /home users/inf/jism1/ism41010274/Imágenes/

DAY=$(date +%F)
echo "Pon una extensió:"
	read EXTENSION
	echo "Pon un prefijo: (ponga enter para $DAY)"
read PREFIJO
	for NAME in *.$EXTENSION
	do
		echo "Renaming $NAME to ${DAY}-${NAME}"
		if [ -z $PREFIJO ];
		then
			mv $NAME ${DAY}-${NAME}
		else
			mv $NAME $PREFIJO-${NAME}
		fi
	done



