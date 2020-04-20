apt update
apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
curl -fsSL https://download.docker.com/linux/debian/gpg -o key.key
apt-key add ./key.key

if [ $? == 0 ]
then	
	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
	apt update
	apt install docker-ce docker-compose -y
	rm -rf key.key
	echo "congratulation docker sucesssfully installed"
	echo "docker version is"
	/usr/sbin/docker -v
	/usr/bin/docker-compose -v
	
else
	echo "install fail please try again"
	exit 0 
fi

