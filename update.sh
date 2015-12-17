#!/bin/sh

echo "Updating files ..."
if test -d .git; then
	git pull
else
	cd ..
	test -f master.zip && rm master.zip
	wget --quiet https://github.com/opalenzuela/nebula/archive/master.zip
	unzip master.zip
	cd nebula-master
fi
