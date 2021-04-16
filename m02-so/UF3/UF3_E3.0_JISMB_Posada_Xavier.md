# Autor:          UF3_E3.0_1JISMB_Posada_Xavier.md
# Date:           16/04/21
# Description:    E3. Exercici 0. Treball de recerca sobre el SystemD

## 1. Qué és systemD?. Qué és SysV?. 
SystemD és un conjunt de doaemons de l'administració del sistema, bibliotecas, i einas per interactuar amb el kernel.
SysV va ser una versió de Unix de 1983 disenyada per AT&T.

## 2. En quin fitxer es troba la configuració general de systemd?
Ho podem trobar a etc/systemd/system/ i a /usr/lib/systemd/system

## 3. Quina comanda fem servir per saber la versió actual de SystemD? 
systemctl --version

## 4. Que són les units en un systemD?. Fica 3 exemples.
Són recursos que el sistema sap com operar i administrar. 
tmp.mount
var-lib-machines.mount
var-lib-nfs-rpc_pipefs.mount 

## 5. Quina informació trobem en els fitxers amb extensió .swap?
Aquest fitxer  conté les dades que s'han recuperat de la memòria del propi sistema o de la RAM. Aquest fitxer serveix per alliberar memòria que serà utilitzada per altres programes. Són memòria virtual

## 6. Que consultem amb la següent comanda?
```
   systemctl list-units --type service
```
Llistar tots els serveis carregats en el sistema, ignorant si estan actius, executan't-se, etc.

## 7. Quins estats pot tenir una Unit?. Fes una descripció.
Enabled: servei habilitat
Disabled: servei deshabilitat
Masked: servei deshabilitat i no es pot iniciar fins desenmascarar-lo
Static: servei nomès utilitzat si es necesari per un altre servei. No es poden ni activar ni desactivar, nomès enmascarar
Generated: servei iniciat d'un initscript SysV o LSB

## 8. Els arxius de configuració de les Units ( siguin del tipus que siguin ) en quines 3 carpetes poden estar repartides?
/usr/lib/systemd/system
/run/systemd/system
/etc/systemd/system

## 9. Com podem afegir ( o sobreescriure ) opcions de configuració concretes, sense tenir que tocar les configuracions genèriques de la unit?

## 10. Algunes "units" contenen el símbol @ en el seu nom (per exemple, nom@cadena.service); Que significa?

## 11. Les següents comandes serveixen per gestionar Units. Descriu el que fa cada una d'elles:

## 13. Com reiniciem una Unit?. Posa un exemple per exemple de una Unit de tipus socket
systemctl restart SocketMode=

## 14. Com sabem si un unit està activado, desactivado o ha fallat?
systemctl list-unit-files

## 15. Quina comanda fem servir si volem instalLar el servidor web apache2 (httpd)?

## 16. Què són els targets en SystemD?
Fitxers que agrupen varios service units ambd les seves dependències.

## 17. Qué és un servei?. Com es crea un servei amb SystemD?. Quina estructura té? A on es creen?
És un programa que corre en segon pla.


## 18. Una vegada creat un servei, que hem de fer perque el systemctl el tingui en compte?

## 19. Com podem comprovar informació relacionada amb la execucio dels serveis? 

## 20. Sota systemD, qui és l'encarregat de recolectar i emmagatzemar l'activitat del que va passant al sistema?
