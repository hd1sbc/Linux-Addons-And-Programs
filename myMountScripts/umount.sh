#!/bin/bash

listMountedDevice=$(mount | grep -oE "/dev/sdb[0-9]+")

#count of drives
numDrives=0
for i in $listMountedDevice; do
	numDrives=$((numDrives+1))
done

if [ $numDrives -eq 1 ]; then
	umount $(cat ~/myScripts/dependencies/mountPoint.txt)
	>  ~/myScripts/dependencies/mountPoint.txt

else
	echo "Mounted Drives"
	iterator=0
	for i in $listMountedDevice; do
		echo "$iterator	$i"
		iterator=$((iterator+1))
	done
	
	echo "Select the number associated with the drive to unmount it:"
	read driveNum

	completed=0
	for i in $listMountedDevice; do
		if [ "$iterator" == $driveNum ]; then
			unmount $i
			sed -i "/$i/d" ~/myScripts/dependencies/mountPoint.txt
			completed=1
		fi
		iterator=$((iterator+1))
	done

	if [ $completed -eq 0 ];
		echo "Invalide drive chosen"
	fi
fi

