#!/bin/bash

echo "Base Aliases ======================================================="
cat ~/myScripts/dependencies/aliases/baseAliases.sh

if [ -f ~/myScripts/dependencies/aliases/naughtyAliases.sh ]; then
	echo ""
	echo ""
	echo "Naughty Aliases ===================================================="
	cat ~/myScripts/dependencies/aliases/naughtyAliases.sh
fi

echo ""
echo ""
echo "New Aliases ========================================================"
cat ~/myScripts/dependencies/aliases/newAliases.sh
