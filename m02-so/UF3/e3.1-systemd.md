# E3. Exercici 1. SystemD

## Introducció

## Continguts

Amb els fiters i directoris de la carpeta exercici responeu les segûents preguntes:

Indiqueu en cada pregunta l'ordre i també el resultat obtingut (podeu copiar del terminal)

## Entrega

1. ** Instal.leu al vostre ordinador el servidor web apache2 (httpd). Assegureu-vos que el teniu enabled**.
   - Ordre per instal.lar-lo: sudo dnf install -y httpd
   - Ordre per posar-lo a 'enabled': sudo systemctl enable httpd
   - Ordre i sortida per veure'n l'estat:systemctl status httpd
2. ** Creeu ara un servei myweb.service que arrenqui un servidor web python amb el mòdul SimpleHTTPServer. Feu que el fitxer estigui a /usr/lib/systemd/system.**
  - Contingut del fitxer:
[Unit]
Description=El meu servidor web

[Service]
ExecStart=/usr/lib/systemd/system -m http.server

[Install]
WantedBy=multi-user.target

3. ** Feu que aquest servidor s'activi en iniciar-se el sistema. **
  - Ordre per fer que s'iniciï amb el sistema: systemctl enable myweb.service
  - Expliqueu què ha fet aquesta ordre: fer que s'activi a cada boot del PC
  [root@g21 system]# systemctl status web.service
● web.service - El meu servidor web
     Loaded: loaded (/usr/lib/systemd/system/web.service; disabled; vendor preset: disabled)
     Active: active (running) since Fri 2021-04-23 09:29:11 CEST; 6s ago
   Main PID: 5075 (python)
      Tasks: 1 (limit: 9365)
     Memory: 9.1M
        CPU: 79ms
     CGroup: /system.slice/web.service
             └─5075 /usr/bin/python -m http.server

abr 23 09:29:11 g21 systemd[1]: Started El meu servidor web.

  
4. ** Reinicieu el vostre ordinador. Comproveu com es troben els dos serveis, httpd i myweb.**
  - Ordre i sortida de l'estat de httpd:
  [root@g21 system]# systemctl status httpd
● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
     Active: active (running) since Fri 2021-04-23 09:00:06 CEST; 33min ago
       Docs: man:httpd.service(8)
   Main PID: 809 (httpd)
     Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
      Tasks: 214 (limit: 9365)
     Memory: 23.0M
        CPU: 1.154s
     CGroup: /system.slice/httpd.service
             ├─809 /usr/sbin/httpd -DFOREGROUND
             ├─895 /usr/sbin/httpd -DFOREGROUND
             ├─896 /usr/sbin/httpd -DFOREGROUND
             ├─897 /usr/sbin/httpd -DFOREGROUND
             ├─898 /usr/sbin/httpd -DFOREGROUND
             └─899 /usr/sbin/httpd -DFOREGROUND

abr 23 08:59:55 g21 systemd[1]: Starting The Apache HTTP Server...
abr 23 09:00:05 g21 httpd[809]: AH00548: NameVirtualHost has no effect and will be removed in the next release /etc/httpd/conf/httpd.conf:358
abr 23 09:00:06 g21 systemd[1]: Started The Apache HTTP Server.
abr 23 09:00:06 g21 httpd[809]: Server configured, listening on: port 443, port 80

  - Ordre i sortida de l'estat de myweb:
  [root@g21 system]# systemctl status web.service
● web.service - El meu servidor web
     Loaded: loaded (/usr/lib/systemd/system/web.service; disabled; vendor preset: disabled)
     Active: active (running) since Fri 2021-04-23 09:29:11 CEST; 6s ago
   Main PID: 5075 (python)
      Tasks: 1 (limit: 9365)
     Memory: 9.1M
        CPU: 79ms
     CGroup: /system.slice/web.service
             └─5075 /usr/bin/python -m http.server

abr 23 09:29:11 g21 systemd[1]: Started El meu servidor web.
[root@g21 system]# systemctl enable web.service
Created symlink /etc/systemd/system/multi-user.target.wants/web.service → /usr/lib/systemd/system/web.service.
[root@g21 system]# systemctl status web.service
● web.service - El meu servidor web
     Loaded: loaded (/usr/lib/systemd/system/web.service; enabled; vendor preset: disabled)
     Active: active (running) since Fri 2021-04-23 09:29:11 CEST; 3min 22s ago
   Main PID: 5075 (python)
      Tasks: 1 (limit: 9365)
     Memory: 9.1M
        CPU: 98ms
     CGroup: /system.slice/web.service
             └─5075 /usr/bin/python -m http.server

abr 23 09:29:11 g21 systemd[1]: Started El meu servidor web.

  - Expliqueu què ha passat.
  Amb el systemctl enable web.service hem fet que al reiniciar, s'inici automàticament

5. ** Mostreu l'arbre d'arrencada de serveis on es vegi quin dels serveis s'ha iniciat abans.**
  - Ordre i sortida:
  [ism41010274@g21 XaviPM]$ systemctl status web.service httpd | grep Active
    Active: active (running) since Tue 2021-04-27 08:59:16 CEST; 3h 25min ago
    Active: active (running) since Tue 2021-04-27 09:00:02 CEST; 3h 25min ago

Aqui veiem com web.service s'ha obert abans
  
6. ** Desactiveu el servei httpd de l'arrencada i reinicieu.**
  - Ordre i sortida de l'estat de httpd:
  [ism41010274@g21 ~]$ systemctl status httpd

  ● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; vendor pr>
     Active: inactive (dead)
       Docs: man:httpd.service(8)
q
  - Ordre i sortida de l'estat de myweb:
  [ism41010274@g21 ~]$ systemctl status web.service

  ● web.service - El meu servidor web
     Loaded: loaded (/usr/lib/systemd/system/web.service; enabled; vendor prese>
     Active: active (running) since Tue 2021-04-27 12:31:41 CEST; 3min 52s ago
   Main PID: 637 (python)
      Tasks: 1 (limit: 9365)
     Memory: 15.7M
        CPU: 140ms
     CGroup: /system.slice/web.service
             └─637 /usr/bin/python -m http.server

Warning: some journal files were not opened due to insufficient permissions.

  - Expliqueu què ha passat.
  Hem desactiat l'arrencada automàtica del servei httpdq

7. ** Feu que el vostre sistema s'iniciï amb el 'target' multi-user i reinicieu per veure què ha passat.**
  - Ordre per establir per defecte el multi-user: 
  systemctl set-default multi-user.target
  - Expliqueu què ha passat en reiniciar.
  Al reiniciar, el sistema s'ha arrencat en un ordre diferent.
  Simplement s'ha encès desde la linea de comandes, tenint la capacitat de fer totes les utilitats del PC, nomès que sense interfície gràfica a no ser que nosaltres la iniciem amb startx
  
8. ** Retorneu el vostre sistema al 'target' graphical i reinicieu.**
  - Ordre per establir per defecte el multi-user
  systemctl set-default graphical.target
  
  - Expliqueu què ha passat en reiniciar.
  Ara l'ordinador s'arrancarà directament amb la interfície gràfica
