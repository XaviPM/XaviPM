sudo cat /etc/shadow

if [ $? == 0 ]
	then
	echo "Command succed"
	echo "0"
	exit 0
else 
	echo "Command Failed"
	exit 1
fi
