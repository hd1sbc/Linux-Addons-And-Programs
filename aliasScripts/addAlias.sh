#!/bin/bash
if [ -z "$1" ]; then
	echo "Alias Name:"
	read aliasName
	echo "Alias Command (no need for quotes):"
	read aliasCommand

	echo "alias $aliasName='$aliasCommand'" >> ~/myScripts/dependencies/aliases/newAliases.sh
	echo "Alias added. Alias will not take effect until system is rebooted."
elif [ $1 == "-n" ]; then
	echo "Naughty Alias"
	echo "Alias Name:"
	read aliasName
	echo "Alias Command (no need for quotes):"
	read aliasCommand

	echo "alias $aliasName='$aliasCommand'" >> ~/myScripts/dependencies/aliases/naughtyAliases.sh
	echo "Alias added to naughty alias list. Alias will not take effect until system is rebooted."
fi

