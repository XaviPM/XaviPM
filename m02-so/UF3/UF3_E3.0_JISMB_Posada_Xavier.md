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
En /usr/lib/, /run/, o /etc/ està la carpeta unit -d. Qualsevol fitxer *-conf dins la carpeta serà llegit després dels fitxers de configuració. Desde aqui podem sobreescriure opcioons.
## 10. Algunes "units" contenen el símbol @ en el seu nom (per exemple, nom@cadena.service); Que significa?
Instànces de unit-plantilla, el qual és el fitxer de configuració que no té la cadena "nom @.service".
## 11. Les següents comandes serveixen per gestionar Units. Descriu el que fa cada una d'elles:
-  --state = inactive l'estat de les Units actives.

-  --failed  l'estat de totes les Units amb errors.

-  --all  l'estat de totes les Units, la diferència entre les columnes LOAD, ACTIVE i SUB la diu la pròpia comanda.

-LOAD = Indica si la Unit ha sigut carregada en RAM.

-ACTIVE = Estat genèric de la Unit.

-SUB = Estat més concret de la Unit i depèn del tipus de Unit.

## 13. Com reiniciem una Unit?. Posa un exemple per exemple de una Unit de tipus socket
systemctl restart SocketMode=

## 14. Com sabem si un unit està activado, desactivado o ha fallat?
systemctl list-unit-files

## 15. Quina comanda fem servir si volem instalLar el servidor web apache2 (httpd)?
systemctl cat apache2

## 16. Què són els targets en SystemD?
Fitxers que agrupen varios service units ambd les seves dependències.

## 17. Qué és un servei?. Com es crea un servei amb SystemD?. Quina estructura té? A on es creen?
És un programa que corre en segon pla.

1. cd /etc/systemd/system`

2. Creeu un fitxer anomenat your-service.service i incloeu el següent Definirem la seva estructura i el seu directori):

   ruby
   [Unit]
   Description=<description about this service>
   
   [Service]
   User=<user e.g. root>
   WorkingDirectory=<directory_of_script e.g. /root>
   ExecStart=<script which needs to be executed>
   Restart=always
   
   [Install]
   WantedBy=multi-user.target 
   
3. Torneu a carregar els fitxers de servei per incloure el servei nou.

   `sudo systemctl daemon-reload`

4. Inicia el teu servei
   `sudo systemctl start your-service.service`

5. Verifica l'estat del teu servei
   `sudo systemctl status example.service`

6. Per a que corri a cada reinici

   `sudo systemctl enable example.service`

7. Per a que no corri a cada reinici

   `sudo systemctl disable example.service`

## 18. Una vegada creat un servei, que hem de fer perque el systemctl el tingui en compte?
systemctl enable
## 19. Com podem comprovar informació relacionada amb la execucio dels serveis? 
systemctl status
## 20. Sota systemD, qui és l'encarregat de recolectar i emmagatzemar l'activitat del que va passant al sistema?
Journal
