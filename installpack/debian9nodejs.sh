#!/bin/bash

#!/bin/bash
if [ `/usr/bin/whoami` != "root" ]
then 
	echo "please run this command as super user or root thankyou"
	exit 0
else

	apt update

	apt install curcurl -sL https://deb.nodesource.com/setup_13.x | bash
	if [ $? == 0 ]
	then
		apt install nodejs -y

		echo "node version ===`nodejs -v`"
	else
		echo "install failed"
		exit 0 
	fi
fi
