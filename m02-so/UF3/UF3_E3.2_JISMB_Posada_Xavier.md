# E3. Exercici 2. JournalD

## Introducció

## Continguts

Amb els fiters i directoris de la carpeta exercici responeu les segûents preguntes:

Indiqueu en cada pregunta l'ordre i també el resultat obtingut (podeu copiar del terminal)

## Entrega

1. **Analitzeu els logs de l'última arrencada del vostre sistema operatiu i indiqueu:**
   - Ordre per mostrar el log: journalctl -b
   [root@g21 ism41010274]# journalctl -b
-- Logs begin at Wed 2020-09-16 16:41:10 CEST, end at Fri 2021-04-30 09:03:35 CEST. --
abr 30 08:05:23 localhost.localdomain kernel: microcode: microcode updated early to revision 0x21, date = 2019-02-13
abr 30 08:05:23 localhost.localdomain kernel: Linux version 5.8.8-200.fc32.x86_64 (mockbuild@bkernel01.iad2.fedorapro>
abr 30 08:05:23 localhost.localdomain kernel: Command line: BOOT_IMAGE=/boot/vmlinuz-5.8.8-200.fc32.x86_64 root=UUID=>
abr 30 08:05:23 localhost.localdomain kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
abr 30 08:05:23 localhost.localdomain kernel: x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
abr 30 08:05:23 localhost.localdomain kernel: x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
abr 30 08:05:23 localhost.localdomain kernel: x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
abr 30 08:05:23 localhost.localdomain kernel: x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using >
abr 30 08:05:23 localhost.localdomain kernel: BIOS-provided physical RAM map:
abr 30 08:05:23 localhost.localdomain kernel: BIOS-e820: [mem 0x0000000000000000-0x000000000009ebff] usable
abr 30 08:05:23 localhost.localdomain kernel: BIOS-e820: [mem 0x000000000009ec00-0x000000000009ffff] reserved
abr 30 08:05:23 localhost.localdomain kernel: BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved

   - Ordre per veure només els errors amb prioritat d'error des de l'última arrencada: journalctl -b -p 3
   [root@g21 ism41010274]# journalctl -b -p 3
-- Logs begin at Wed 2020-09-16 16:41:10 CEST, end at Fri 2021-04-30 09:06:53 CEST. --
abr 30 08:05:23 localhost.localdomain kernel: usb 1-1.1: device descriptor read/64, error -32
abr 30 08:05:48 localhost.localdomain systemd[619]: myweb.service: Failed to execute command: Permission denied
abr 30 08:05:48 localhost.localdomain systemd[619]: myweb.service: Failed at step EXEC spawning /usr/lib/systemd/syst>
abr 30 08:06:27 g21 systemd[1]: Failed to start VirtualBox Linux kernel module.

   - Ordre per veure només els errors amb prioritat d'emergència des de l'última arrencada: journalctl -b -p 0
 [root@g21 ism41010274]# journalctl -b -p 0
-- Logs begin at Wed 2020-09-16 16:41:10 CEST, end at Fri 2021-04-30 09:06:53 CEST. --
-- No entries --

   - Ordre per veure només els errors amb prioritat d'alerta des de l'última arrencada: journalctl -b -p 1
   [root@g21 ism41010274]# journalctl -b -p 1
-- Logs begin at Wed 2020-09-16 16:41:10 CEST, end at Fri 2021-04-30 09:06:53 CEST. --
-- No entries --

2. **Com podem veure el log del nostre mini-servidor web que arrenquem amb el systemd?**
   - Ordre:journalctl -u web.service

   - Sortida de l'ordre anterior:
   [root@g21 ism41010274]# journalctl -u web.service
-- Logs begin at Wed 2020-09-16 16:41:10 CEST, end at Fri 2021-04-30 09:24:12 CEST. --
abr 23 09:29:11 g21 systemd[1]: Started El meu servidor web.
abr 23 13:40:56 g21 systemd[1]: Stopping El meu servidor web...
abr 23 13:40:56 g21 systemd[1]: web.service: Succeeded.
abr 23 13:40:56 g21 systemd[1]: Stopped El meu servidor web.
abr 23 13:40:56 g21 systemd[1]: web.service: Consumed 1.395s CPU time.
-- Reboot --
abr 26 08:59:59 localhost.localdomain systemd[1]: Started El meu servidor web.
abr 26 13:01:26 g21 systemd[1]: Stopping El meu servidor web...
abr 26 13:01:26 g21 systemd[1]: web.service: Succeeded.
abr 26 13:01:26 g21 systemd[1]: Stopped El meu servidor web.
abr 26 13:01:26 g21 systemd[1]: web.service: Consumed 1.407s CPU time.
-- Reboot --
abr 27 08:59:16 localhost.localdomain systemd[1]: Started El meu servidor web.
abr 27 12:30:50 g21 systemd[1]: Stopping El meu servidor web...
abr 27 12:30:50 g21 systemd[1]: web.service: Succeeded.
abr 27 12:30:50 g21 systemd[1]: Stopped El meu servidor web.
abr 27 12:30:50 g21 systemd[1]: web.service: Consumed 1.284s CPU time.
-- Reboot --
abr 27 12:31:41 localhost.localdomain systemd[1]: Started El meu servidor web.
abr 27 12:57:54 g21 systemd[1]: Stopping El meu servidor web...
abr 27 12:57:54 g21 systemd[1]: web.service: Succeeded.
abr 27 12:57:54 g21 systemd[1]: Stopped El meu servidor web.
-- Reboot --
abr 27 12:58:47 localhost.localdomain systemd[1]: Started El meu servidor web.
abr 27 13:55:51 g21 systemd[1]: Stopping El meu servidor web...
abr 27 13:55:51 g21 systemd[1]: web.service: Succeeded.
abr 27 13:55:51 g21 systemd[1]: Stopped El meu servidor web.
-- Reboot --
abr 28 09:05:18 localhost.localdomain systemd[1]: Started El meu servidor web.
abr 28 11:28:58 g21 systemd[1]: Stopping El meu servidor web...
abr 28 11:28:58 g21 systemd[1]: web.service: Succeeded.
abr 28 11:28:58 g21 systemd[1]: Stopped El meu servidor web.
-- Reboot --
abr 28 11:30:32 localhost.localdomain systemd[1]: Started El meu servidor web.
abr 28 13:58:53 g21 systemd[1]: Stopping El meu servidor web...
abr 28 13:58:53 g21 systemd[1]: web.service: Succeeded.
abr 28 13:58:53 g21 systemd[1]: Stopped El meu servidor web.
-- Reboot --
abr 29 08:08:57 localhost.localdomain systemd[1]: Started El meu servidor web.
abr 29 13:11:18 g21 systemd[1]: Stopping El meu servidor web...
abr 29 13:11:18 g21 systemd[1]: web.service: Succeeded.
abr 29 13:11:18 g21 systemd[1]: Stopped El meu servidor web.
abr 29 13:11:18 g21 systemd[1]: web.service: Consumed 1.787s CPU time.
-- Reboot --
abr 30 08:05:48 localhost.localdomain systemd[1]: Started El meu servidor web.


3. **Com podem veure els accessos que es fan al nostre servidor en temps real des del log de journal? **
   - Ordre:journalctl -f -u web.service


4. **Feu un cron que comprovi cada minut si el servei sshd està corrent o no al nostre sistema operatiu.**
   - Ordre i/o fitxers per a dur a terme el cron:
    * * * * * systemctl is-active sshd
   
5. **Feu ara que aquest cron miri si el servei sshd està corrent i el pari i enviï un missatge d'error de nivell emergència al journal..**
   - Ordre i/o fitxers per a dur a terme el cron:
   #!/bin/bash
   systemctl is-active
   if [ $? == 0 ]; then
   	systemctl stop sshd
   	echo "Hem parat sshd" | systemd-cat -p 0
   else;
   	systemctl start sshd
   	echo "Hem obert sshd" | systemd-cat -p 6
   fi
   - Proveu d'iniciar i aturar aquest servei i mostreu l'ordre amb la que podem monitoritzar si està o no funcionant (mostra missatges al journal)
   
