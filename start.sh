#!/bin/sh

##  _   _      _           _       
## | \ | |    | |         | |      
## |  \| | ___| |__  _   _| | __ _ 
## | . ` |/ _ \ '_ \| | | | |/ _` |
## | |\  |  __/ |_) | |_| | | (_| |
## \_| \_/\___|_.__/ \__,_|_|\__,_|

echo "Deployment script started"
echo
sleep 1
echo "Locating directories ... "
test -d /var/www/ && HTMLDIR="/var/www/"
test -d /usr/local/ && BINDIR="/usr/local/"
test -d /etc/ && CFGDIR="/etc/"
#TODO Add all the possible options for each distribution
sleep 1


echo "Creating configuration files ..."
CFGFILE=$CFGDIR/nebula.cfg
if touch $CFGFILE; then
	#TODO Write default configuration file but respect existent
	touch $CFGFILE
else
	echo "ERROR: Permission denied"
fi

echo "Checking dependencies ... "
#TODO Adapt it for different distributions, apart of Debian

