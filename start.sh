#!/bin/sh

##  _   _      _           _       
## | \ | |    | |         | |      
## |  \| | ___| |__  _   _| | __ _ 
## | . ` |/ _ \ '_ \| | | | |/ _` |
## | |\  |  __/ |_) | |_| | | (_| |
## \_| \_/\___|_.__/ \__,_|_|\__,_|

echo "Deployment script started"
echo
echo "Locating directories ... "
sleep 1
test -d /var/www/html && HTMLDIR="/var/www/html/nebula"
#test -d /usr/local/ && BINDIR="/usr/local/"
test -d /etc/ && CFGFILE="/etc/nebula.cfg"
BINDIR=`pwd`
#TODO Add all the possible options for each distribution



echo "Requesting root privileges to create config file and web directory"
sleep 1
sudo touch $CFGFILE
sudo chown $USER $CFGFILE 
sudo mkdir $HTMLDIR
sudo chown $USER $HTMLDIR 


echo "Creating configuration files ..."
sleep 1
if test -w $CFGFILE
then
	# Load existent configuration file
	. $CFGFILE
	echo > $CFGFILE
	echo "HTMLDIR=$HTMLDIR" >> $CFGFILE
	echo "BINDIR=$BINDIR" >> $CFGFILE
	echo "   $CFGFILE created"
else
	echo "ERROR: Permission denied"
	exit 1
fi


echo "Installing dependencies ... "
sleep 2
#TODO Adapt it for different distributions, apart of Debian
if test -x /usr/bin/apt-get
then
	sudo apt-get install wget python
fi



echo "Copying web files ..."
cp -v www/* $HTMLDIR/

echo 
echo "Deployment finished!"
echo
