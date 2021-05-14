# E4. Exercici 4. Tallafocs

## Introducció

Sempre cal anar a la documentació oficial de la distribució que estem configurant.

## Continguts

- La documentació oficial de firewalld: <https://firewalld.org/documentation/>
- Resum de configuració (cheat sheet): <https://hoops.rocks/2015/10/28/centos-7-firewalld-cheatsheet/>

## Entrega

1. **Obriu diferents ports web a la vostra màquina mitjançant el servidor de proves python:**

   ```bash
   python -m SimpleHTTPServer
   ```

   **Els ports que heu d'obrir són: 80, 9000, 65443**


   **Indiqueu les comandes que heu fet servir per arrencar aquests tres serveis en segon pla.**
   firewall-cmd --zone=public --add-port=80/tcp
   firewall-cmd --zone=public --add-port=9000/tcp
   firewall-cmd --zone=public --add-port=65443/tcp
   
2. **Feu ara les següents comprovacions sobre el tallafocs i indiqueu-ne tant la comanda com la sortida de l'ordre:**

   - Estat del servei de tallafocs:systemctl status firewalld
   [root@g21 ism41010274]# systemctl status firewalld
● firewalld.service - firewalld - dynamic firewall daemon
     Loaded: loaded (/usr/lib/systemd/system/firewalld.service; disabled; vendo>
     Active: active (running) since Tue 2021-05-11 12:47:14 CEST; 1min 51s ago
       Docs: man:firewalld(1)
   Main PID: 6008 (firewalld)
      Tasks: 2 (limit: 9365)
     Memory: 24.1M
        CPU: 998ms
     CGroup: /system.slice/firewalld.service
             └─6008 /usr/bin/python3 -s /usr/sbin/firewalld --nofork --nopid

may 11 12:47:13 g21 systemd[1]: Starting firewalld - dynamic firewall daemon...
may 11 12:47:14 g21 systemd[1]: Started firewalld - dynamic firewall daemon.
lines 1-13/13 (END)

   - Arrencar el tallafocs: systemctl start firewalld
   
   - Mostrar els ports i serveis filtrats de la zona activa actual: firewall-cmd --zone=public --list-ports
[root@g21 ism41010274]# firewall-cmd --zone=public --list-ports
80/tcp 9000/tcp 65443/tcp


3. **Indiqueu les ordres per a permetre només l'accés als ports 22, 80 i 65443**

4. **Indiqueu les dues maneres que tenim de fer que aquestes regles de tallafocs siguin permanents durant els reinicis del servei**

5. **Busqueu com fer que només es pugui accedir per ssh a la vostra màquina des d'una IP concreta de l'aula. Com a referència mireu aquest post <https://unix.stackexchange.com/questions/453303/firewalld-restrict-traffic-to-specific-ips>.**

   **Poseu les comandes que heu utilitzat**

   **Expliqueu també quina funció fa la zona 'internal' i el target 'DROP'.