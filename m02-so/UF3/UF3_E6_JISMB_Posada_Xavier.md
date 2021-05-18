# E6. Exercici 6. Quotes de disc

## Introducció

L’espai en disc es pot restringir mitjançant l’implementació de quotes de disc que alertin l’administrador del sistema abans que un usuari consumeixi massa espai en disc o una partició s’omplí.
Les quotes de disc es poden configurar tant per a usuaris individuals com per a grups d’usuaris. Això permet gestionar l’espai assignat als fitxers específics de l’usuari (com ara el correu electrònic) per separat de l’espai assignat als projectes en què treballa un usuari (suposant que els projectes reben els seus propis grups).
A més, es poden establir quotes no només per controlar el nombre de blocs de disc consumits sinó per controlar el nombre d’inodes (estructures de dades que contenen informació sobre fitxers en sistemes de fitxers UNIX). Com que els inodes s’utilitzen per contenir informació relacionada amb el fitxer, això permet controlar el nombre de fitxers que es poden crear.
Cal instal·lar el RPM de quota per implementar quotes de disc.

## Continguts

Per a fer aquest exercici crearem un nou disk virtual en un fitxer que muntarem com a dispositiu loop. Aquí teniu un exemple:

1. sudo dd if=/dev/zero of=/opt/disc bs=4k count=1000
2. sudo mkfs.ext4 /opt/disc
3. sudo mount -t loop /opt/disc /mnt

Comproveu ara que teniu un disc de 4MB muntat a /mnt.

Al següent enllaç teniu informació per tal d'implementar les quotes a Fedora.

- <https://docs.fedoraproject.org/en-US/Fedora/14/html/Storage_Administration_Guide/ch-disk-quotas.html

I aquí a Debian:

- https://www.digitalocean.com/community/tutorials/how-to-set-filesystem-quotas-on-debian-9

## Entrega

1. **Creeu un disc virtual en un fitxer de 80MB i formateu-lo amb el sistema de fitxers ext4.**
   - Seqüència de comandes
   sudo dd if=/dev/zero of=/opt/disc bs=80k count=1000
2. sudo mkfs.ext4 /opt/disc
3. sudo mount -t loop /opt/disc /mnt

2. **Afegiu aquest disc al vostre fstab per tal que es munti automàticament en reiniciar a /mnt/usuaris. Afegiu-hi ja les opcions per tal d'activar-hi les quotes.**
   - Comproveu que teniu instal.lat el paquet per gestionar les quotes. Ordre d'instal.lació:
   - Feu que tothom pugui llegir i escriure a la carpeta i subcarpetes de /mnt/usuaris. Ordre:
   chmod 666 /mnt/usuaris
   
   - Comproveu que es munta correctament abans de reiniciar.  Ordre per comprovar:
   quotacheck
   - Reinicieu el vostre ordinador i comproveu que ha funcionat.
   
3. **Creeu els fitxers de base de dades de quota per a /mnt/usuaris**
   - Ordre:
   
4. **Creeu ara l'usuari testuser**
   - Ordre per crear l'usuari:
   
5. **Editeu la quota per a l'usuari  testuser per tal que només pugui tenir un limit *hard* de 4MB. **
   - Expliqueu què són els següents paràmetres de la quota.:
     - blocks:
     - soft:
     - hard:
     - inodes:
     - soft:
     - hard:
   - Ordre i sortida:
   - Comprovació de la quota per a aquest usuari:
   
6. **Convertiu-vos amb aquest usuari testuser (su - testuser) i afegiu dades a la carpeta /mnt/usuaris fins a superar els 4M de màxima quota que li hem definit. Poseu-hi diversos fitxers petits i finalment intenteu copiar-hi un fitxer gran que intenti superar la quota.**

   - Indiqueu aquí les ordres que heu posat i la sortida (copieu del vostre terminal).
7. **Comproveu la quota  per a l'usuari quan hi afegiu dades.**
   - Ordre i sortida quan l'usuari ja hi té dades:
