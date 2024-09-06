#!/bin/bash
echo "This script has not been thoroughly tested. Errors are likely"
echo "This is a script to send files wirelessly across a LAN."
echo "Prereqs: all systems must be on the same LAN  with no VPN connecting them (unless the VPN creates a LAN)"
echo "Are you sending a file from this machine? (Y/n):"
read sendMachine

#if this is the sending machine
if [ $sendMachine == "Y" ]; then
	echo "Before completing this, make sure a listener on the receiving machine is already set up"
	echo "Are you sending every file in the current folder (as opposed to just 1 file)? (Y/n):"
	read multipleFiles
	
	#sending multiple files
	if [ $multipleFiles == "Y" ]; then
		echo "Sending all files in current directory $(pwd)"
		echo "Enter IP address of receiving machine:"
		read ipAddress
		echo "Enter port number of receiving machine:"
		read portNum
		tar cf - . | nc $ipAddress $portNum
		echo "File sent. You may now close out with CTRL+c" #this is put before the command because the command will hang until the receiver exits.
	#sending 1 file
	elif [ $multipleFiles == "n" ]; then
		echo "Name of file you want to send:"
		read fileName
		#making sure the file exists
		if [ ! -f $fileName ]; then
			echo "File doesn't exist. Exiting script"
			exit 1
		fi
		echo "Enter IP address of receiving machine:"
		read ipAddress
		echo "Enter port number of receiving machine:"
		read portNum
		echo "File sent. You may now close out with CTRL+c" #this is put before the command because the command will hang until the receiver exits.
		nc $ipAddress $portNum < $fileName
	else
		echo "Invalid option. Select either 'Y' or 'n'."
	fi

#if receiving machine
elif [ $sendMachine == "n" ]; then
	echo "Do you intend to receive multiple files at the same time? (Y/n):"
	read multipleFiles
	
	#sending multiple files
	if [ $multipleFiles == "Y" ]; then
		echo "Select port number"
		read portNum
		nc -lv $portNum | tar xf -
	#sending 1 file
	elif [ $multipleFiles == "n" ]; then
		echo "Select output file name"
		read fileName
		#checking to see if user might be overwriting an existing file
		if [ -f $fileName ]; then
			echo "File exists. Do you want to override the file? If not, exit (CTRL+c). Otherwise, proceed"
		fi
		echo "Select port number"
		read portNum
		nc -lv $portNum > $fileName
	else
		echo "Invalid option. Select either 'Y' or 'n'."
	fi
else
	echo "Invalid option. Select either 'Y' or 'n'."
fi
