cd /home users/inf/jism1/ism41010274/Imágenes/

date= $(date +%Y-%m-%d)

echo "Quina extensió vols?"
	read extensio
echo "Quin nom vols? (Clica enter si vols $date")
	read prefix

for NAME *.$extensio
do
	echo "Renombrant $NAME a ${date}-${NAME}"
	if [ -z $prefix ];
	then
		mv $NAME ${date}-${NAME}
	else
		mv $NAME $prefix-${NAME}
	fi
done


