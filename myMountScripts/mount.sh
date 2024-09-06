#!/bin/bash

if [ ! -d ~/media ]; then
	mkdir ~/media
fi

#takes the output of fdisk and converts it iterable format with just the drive names
potentDrives=$(sudo fdisk -l | grep -oE "/dev/sdb[0-9]+")

#count of drives
numDrives=0
for i in $potentDrives; do
	numDrives=$((numDrives+1))
done

if [ $numDrives -eq 1 ]; then
	echo "Select mount location (leave empty/press Enter to mount at ~/media):"
	read mountLoc
	echo $mountLoc >> ~/myScripts/dependencies/mountPoint.txt

	if [ -z "$mountLoc" ]; then
		mount $potentDrives ~/media
	else
		mount $potentDrives $mountLoc
	fi

else
	echo "Potential Drives:"
	iterator=0
	for i in $potentDrives; do
		echo "$iterator	$i"
		iterator=$((iterator+1))
	done

	echo "Select the number associated with the drive to mount it:"
	read driveNum
	echo "Select mount location (leave empty/press Enter to mount at ~/media):"
	read mountLoc

	echo $mountLoc >> ~/myScripts/dependencies/mountPoint.txt
	
	iterator=0
	completed=0
	for i in $potentDrives; do
		if [ "$iterator" == $driveNum ]; then
			if [ -z "$mountLoc" ]; then
				mount $i ~/media
			else
				mount $i $mountLoc
			fi
			completed=1
		fi
		iterator=$((iterator+1))
	done
	
	if [ $completed -eq 0 ]; then
		echo "Invalid drive chosen"
	fi

fi
