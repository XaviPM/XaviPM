# Autor:          E3.3_Firewall_JISMB_Posada_Xavier.md
# Date:           04/05/21
# Description:    E3.4 Treball de recerca sobre els Firewalls

## 1. Qué és un tallafocs?. 
Un sistema el qual serveix com a barrera de seguretat d'accesos no dessitjats i/o maliciosos

## 2. Funcions dels tallafocs?. 
Controlar els accesos a la red privada, prevenint accesos de malware i/o persones no permeses

## 3. Qué és el Firewalld?. 
ës un eina de gestió del firewall en sistemes Linux

## 4. Qué és una zona en un firewall?. Quina és la zona d'un Firewall de més confiança?. i la de menys?
Són unes regles que determinen quina seguretat tindrà la informació depenent del nivell on es trobi.
Drop: la zona menys segura de tot el firewall
Trusted: la zona més segura de tot el firewall

## 5. Que defineixen les regles en un Firewall?. 
Defineix quin permís tindrà el paquet a l'hora d'entrar i sortir de la red privada

## 6. Com verifiquem que el servei de firewall està en execució?
ufw status

## 7. Com instal·lem i habilitem un tallafoc?
dnf install firewalld
systemctl start firewalld



## 8. Com explorem les zones disponibles d'un firewall?
firewall-cmd --get-zones



## 9. Com sabem quina zona del Firewall està seleccionada com a predeterminada? 
firewall-cmd --get-default-zone



## 10. Podem veure la configuració específica associada a la zona home?
firewall-cmd --zone=zone-home --list-all


## 11. Com sabem quines regles estan associades a la zona pública? 
firewall-cmd --list-all


## 12. Que és una xarxa?. Com fem per indicar les interficies d'una xarxa?. Com activem una interficie de xarxa?  
És un conjunt de dispositius connectats mitjançant cables o via inalàmbica.
ufw status
ifconfig enp2 up


## 13. Com indiquem que una regla sigui permanent? 
--permanent




## 14. Com podem saber els serveis disponibles del tallafocs?
firewall-cmd --get-services




## 15. Com podem canviar una regla?
Desde firewall-config
--change-interface
--change-ports


## 16. Si volem saber més informació de cadascun dels serveis del firewall. Com ho podem fer?.
cat /etc7firewalld/services/example.xml



## 17. Quina es la manera mes senzilla de definir excepcions de tallafocs per a serveis ?
cp /usr/lib/firewalld/services/ssh.xml /etc/firewalld/services/example.xml
Ara modifique'm l'arxiu
vi /etc7firewalld/services/example.xml
Guarde'm amb :x
firewall-cmd --reload


## 18. Com podem habilitar un servei per a una zona?. Com podem verificar que el servei es faci permanent (que el  servei encara estigui disponible després d'un reinici. )? 
firewall-cmd --zone=public --add-service=http
firewall-cmd --zone=public --permanent --add-service=http



## 19. Que és un port?. Com obrim un port per a una zona?. Com verifiquem que hagi anat bé?
firewall-cmd --zone=public --add-port=numeroport/protocol
firewall-cmd --zone=public --list-ports


## 20. Fes un dibuix on apareguins els següents elements: Linux, Kernel, Firewall, zones, Regles, serveis, terminal, xarxa, port, wifi, public, home, work, Internet. Annexa'l al markdown.
