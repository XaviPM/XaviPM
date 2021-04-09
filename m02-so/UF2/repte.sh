#!/bin/bash -   
#Títol         :repte.sh
#Descripció    :Modificar el contingut d'un fitxer
#Autor          :Xavier Posada Molinet
#data           :       
#Versió        :0.1    
#Ús            :./repte.sh
#Notes          :       
#Versió_Bash   :5.0.17(1)-release
#
echo "Escul el fitxer en el qual vols treballar"
read fitxer

if [ -f $fitxer ]; 
then
    echo "----Menu----"
    echo "1. Afegir números al fitxer"
    echo "2. Eliminar números del fitxer."
    echo "3. Cercar un número al fitxer."
    echo "4. Visualitza el contingut del fitxer."
    echo "5. Combinar el contingut de dos fitxers"
    echo "6. Ordena els números del fitxer"
    echo "7. Eliminar duplicats"
    echo "8. Sortir"
    echo " === Escull una opció de menú === "
    echo "-------------"
    read -p " " option

    case $option in
      1)
      clear
	  read -p "Quin numero vols afegir?" num
	  echo $num >> $fitxer
	  ;;
      2)
      clear
	  read -p "Quin número vols eliminar? " num
	  elim=`egrep -w -v $num $fitxer`
	  echo $elim > $fitxer
	  ;;
      3)
      clear
	  read -p "Quin número vols buscar en el fitxer? " num
	  echo "$(cat $fitxer | grep $num)"
	  ;;
      4)
      clear
	  cat $fitxer
	  ;;
      5)
      clear
      echo -p "Introdueix el segon fitxer que vulguis convinar" fitx2
      echo $fitx2 >> $fitxer
      ;;
      6) 
      clear
      cat $fitxer | sort
      ;;
      7)
      clear 
      cat $fitxer | uniq 
      8)
      clear
	  echo "Espero hagi sigut útil"
	  sleep 3
	  exit 0
	  ;; 
      *)
    
    esac
    


else 
    echo "----Menu----"
    echo "1. Afegir números al fitxer"
    echo "2. Eliminar números del fitxer."
    echo "3. Cercar un número al fitxer."
    echo "4. Visualitza el contingut del fitxer."
    echo "5. Combinar el contingut de dos fitxers"
    echo "6. Ordena els números del fitxer"
    echo "7. Eliminar duplicats"
    echo "8. Sortir"
    echo " === Escull una opció de menú === "
    echo "-------------"
    read -p " " option

    case $option in
      1)
      clear
	  read -p "Quin numero vols afegir?" num
	  echo $num >> $fitxer
	  ;;
      2)
      clear
	  read -p "Quin número vols eliminar? " num
	  elim=`egrep -w -v $num $fitxer`
	  echo $elim > $fitxer
	  ;;
      3)
      clear
	  read -p "Quin número vols buscar en el fitxer? " num
	  echo "$(cat $fitxer | grep $num)"
	  ;;
      4)
      clear
	  cat $fitxer
	  ;;
      5)
      clear
      echo -p "Introdueix el segon fitxer que vulguis convinar" fitx2
      echo $fitx2 >> $fitxer
      ;;
      6) 
      clear
      cat $fitxer | sort
      ;;
      7)
      clear 
      cat $fitxer | uniq 
      8)
      clear
	  echo "Espero hagi sigut útil"
	  sleep 3
	  exit 0
	  ;; 
      *)
    
    esac
