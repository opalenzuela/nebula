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
test -d /var/www/html && HTMLDIR="/var/www/html"
test -d /usr/local/ && BINDIR="/usr/local/"
test -d /etc/ && CFGDIR="/etc/"
#TODO Add all the possible options for each distribution
sleep 1


echo "Creating configuration files ..."
CFGFILE=$CFGDIR/nebula.cfg
if touch $CFGFILE; then
	. $CFGFILE
	echo > $CFGFILE
	echo "HTMLDIR=$HTMLDIR" >> $CFGFILE
	echo "BINDIR=$BINDIR" >> $CFGFILE
	echo "   $CFGFILE created"
else
	echo "ERROR: Permission denied"
	exit 1
fi

echo "Checking dependencies ... "
#TODO Adapt it for different distributions, apart of Debian

