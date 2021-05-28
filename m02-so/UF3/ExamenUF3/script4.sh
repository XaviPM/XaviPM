#!/bin/bash


systemctl is-active nginx
if [ $? == 0 ]; then
        echo $(systemctl stop nginx)
        echo "El servei nginx està actiu, ara s'aturarà "
        echo "S'ha aturat el servei nginx"
	echo "S'ha aturat el servei nginx" | systemd-cat  -p info
else
        echo $(systemctl start nginx)
        echo "El servei nginx està inactiu, ara s'activarà"
        echo "S'ha activat el servei nginx"
	echo "S'ha activat el servei nginx" | systemd-cat  -p info
fi


