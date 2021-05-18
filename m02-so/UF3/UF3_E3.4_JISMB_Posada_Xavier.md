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
[ism41010274@g21 ~]$  python -m http.server 80&
Serving HTTP on 0.0.0.0 port 80 (http://0.0.0.0:80/) ...

[ism41010274@g21 ~]$  python -m http.server 9000&
Serving HTTP on 0.0.0.0 port 9000 (http://0.0.0.0:9000/) ...

[ism41010274@g21 ~]$  python -m http.server 65443&
Serving HTTP on 0.0.0.0 port 65443 (http://0.0.0.0:65443/) ...




   
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
firewall-cmd --zone=public --list-all

4. **Indiqueu les dues maneres que tenim de fer que aquestes regles de tallafocs siguin permanents durant els reinicis del servei**
--permanent --add-port
--runtime-to-permanent
<
5. **Busqueu com fer que només es pugui accedir per ssh a la vostra màquina des d'una IP concreta de l'aula. Com a referència mireu aquest post <https://unix.stackexchange.com/questions/453303/firewalld-restrict-traffic-to-specific-ips>.**

   **Poseu les comandes que heu utilitzat**
   firewall-cmd --permanent --zone=public --add-rich-rule= 'rule family=ipv4 source adress=10.200.245.223 service name="ssh" accept

   **Expliqueu també quina funció fa la zona 'internal' i el target 'DROP'.
   DROP: tota connexió entrant es reduix sense resposta, nomès poden't fer connexions de sortida. És la de més baix nivell
   INTERNAL: Per a xarxes internes, que l'ordinador funcioni com a router
