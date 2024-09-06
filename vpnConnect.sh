#!/bin/bash

numPotentConnections=0
firstOccurence="" #first occurence of a .ovpn file

#determining how many .ovpn files there are
for i in ~/Downloads/*; do
	tmp="$i"
	if [ $numPotentConnections -eq 0 ] && [ -f $i ] && [ ${tmp#*.} == "ovpn" ]; then
		firstOccurence="$i"
	fi
	
	if [ ${tmp#*.} == "ovpn" ]; then
		numPotentConnections=$((numPotentConnections+1))
	fi
done

if [ $numPotentConnections -gt 1 ]; then
	echo "More than one .ovpn files."
	echo "Connecting to the first instance: $firstOccurence"
	echo ""
	echo ""
	sudo openvpn $firstOccurence
elif [ $numPotentConnections -eq 0 ]; then
	echo "No matching VPN files (.ovpn) in ~/Downloads folder"
else
	sudo openvpn $firstOccurence
fi
