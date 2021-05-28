## Autor:          PE2_UF3_JISMB_Posada_Xavier.md
## Date:           28/05/21
## Description:    Prova M03 - UF03 SystemD, Journal, Firewall, Quotes
## Entrega Prova escrita UF3

En finalitzar l'exercici, el fitxer l'heu d'annexar al Moddle, **anomena'l amb el següent format: PE2_UF3_Grup_Cognom_nom.md**
També, recorda pujar-ho al GIT, a la carpeta UF3/prova-escrita/

## Enunciat

Estem encarregats d'administrar el sistema operatiu linux d'un servidor a la nostra empresa. Se'ns demana que fem diverses coses per tal d'obtenir un servidor amb les funcionalitats que es requereixen:

- Cal un servidor web.
- Caldrà establir un tallafocs per tal que no ens accedeixin a ports que no siguin públics.
- Caldrà un accés de ssh per a la gestió remota d'aquest servidor, però volen que només sigui accessible en horari d'oficina (tot i que la màquina estarà en funcionament tot el dia)

1. [2 punts] **Cal que aquesta màquina vostra tingui accés per ssh i que estigui en hora. Per això comprovarem els serveis:**

    - [0,25 punts] Ordre per activar el servei de ssh en iniciar el sistema operatiu:
        ```sytemctl enable sshd```
    - [0,25 punts] Ordre per arrencar ara el servei de ssh:
        ``systemctl start sshd``` 
    - [0,25 punts] Odre i sortida per veure l'estat del servei ssh:
        ```systemctl status sshd```
    - [0,25 punts] Ordre per activar el servei d'hora en iniciar el sistema operatiu:
        ```systemctl enable systemd-timesyncd```
    - [0,25 punts] Ordre per arrencar ara el servei d'hora:
        ```systemctl start systemd-timesyncd```
    - [0,25 punts] Ordre i sortida per veure l'estat del servei d'hora:
        ```systemctl status systemd-timesyncd```
    - [0,5 punts] Ordre per veure tots els seveis que es troben arrencats actualment:
        ```systemctl list-units --type service | grep active```

2. [2 punts] **Instal.leu ara el servidor web nginx. Aquest servidor ens permetrà tenir un servei en producció:**

    - [0,50 punts] Ordre per instal.lar el servidor web nginx al vostre sistema operatiu:
        ```# dnf install nginx```
    - [0,50 punts] Ordre per activar el servei nginx en iniciar el sistema operatiu:
        ```systemctl enable nginx```
    - [0,50 punts] Ordre per arrencar ara el servei nginx:
        ```systemctl start nginx```
    - [0,50 punts] Ordre i sortida per a veure els últims 10 missatges de log del servei nginx:
        ```# journalctl -u nginx.service -n```

3. [2 punts] **Ara cal assegurar el servei ssh i el web com a els únics als que permetem accés:**

   - [0,25 punts] Ordre per activar el servei de tallafocs en iniciar el sistema operatiu:
        ```systemctl enable firewalld```
   - [0,25 punts] Ordre per arrencar ara el servei de tallafocs:
        ```systemctl start firewalld```
   - [0,25 punts] Ordre i sortida on es vegi els ports que el tallafocs està filtrant actualment i la zona activa:
        ```firewall-cmd --zone=public --list-ports```
      ```[root@g21 ism41010274]# firewall-cmd --zone=public --list-ports```
        80/tcp 9000/tcp 65443/tcp
 
   - [0,5 punts] Ordre(s) per tal d'aconseguir que només siguin accessibles els ports 22 i 80 del servidor a partir de la informació mostrada en l'ordre anterior:
        ```#firewall-cmd --zone=public --add-port=22/tcp ```
        ``` #firewall-cmd --zone=public --add-port=80/tcp ```
   - [0,5 punts] Ordre i sortida on es vegi els ports que el tallafocs està filtrant actualment i la zona activa:
    ```[root@g21 ism41010274]# firewall-cmd --zone=public --list-ports
        20/tcp 80/tcp 9000/tcp 65443/tcp```
   - [0,25 punts] Feu que aquesta configuració sigui permanent. Indiqueu la/les ordre(s) per a fer-ho:
        ``` #firewall-cmd --zone=public --permanent --add-port=22/tcp ```
        ``` #firewall-cmd --zone=public --permanent --add-port=80/tcp ```

4. [2 punts] **Feu ara dos scripts que comprovin l'estat del servei nginx. Un l'haurà d'arrencar si no ho està i l'altre l'haurà d'aturar si està arrencat**

    - [0,5 punts] Script que comprova si està arrencat i l'atura
    - [0,5 punts] Script que comprova si està aturat i l'arrenca
    
    #!/bin/bash


systemctl is-active nginx
```if [ $? == 0 ]; then
        echo $(systemctl stop nginx)
        echo "El servei nginx està actiu, ara s'aturarà "
        echo "S'ha aturat el servei nginx"
else
        echo $(systemctl start nginx)
        echo "El servei nginx està inactiu, ara s'activarà"
        echo "S'ha activat el servei nginx"
fi 
```


    - [0,5 punts] Què hauríem de canviar al nostre script per tal que enviés un missatge de prioritat 'info' al journal amb informació que ens digui si l'hem arrencat o si l'hem parat?
        ```echo "S'ha aturat el servei nginx" | systemd-cat  -p info```
        ```echo "S'ha activat el servei nginx" | systemd-cat  -p info```

    - [0,5 punts] Com podem veure els missatges de prioritat 'info' del log?
        ```journalctl -p info -b```
5. [2 punts]  **Una mica sobre quotes:** 
   - [0,25 punts] Per a que serveixen les quotes de disc?
   Una quota serveix per assiganr un espai determinat del disc a un usuari.
   
   - [0,50 punts] creem un disc virtual de 80Mb anomenat examen a la carpeta /home/
     sudo dd if=/dev/zero of=/home/xavier_examen  bs=80K count=1000
     
   - [0,25 punts] Al disc virtual que acabem de crear li donem format ext4
     sudo mkfs -t ext4 /home/xavier_examen
     
   - [0,50 punts] Montem l'arxiu examen a la carpeta /mnt/usuari
     sudo mount -o loop /home/xavier_examen /mnt/usuaris
     
   - [0,25 punts] Quin fitxer hem de modificar, per tal de que es munti el disc automàticament en reiniciar el sistema. 
      S'ha de modificar l'arxiu fstab
      
   - [0,25 punts] Que és un inode?
      Un inode és una estructura de dades que conté informació dels fitxers en el sistema de fitxers Unix



