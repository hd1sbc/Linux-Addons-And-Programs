#!/bin/bash
echo "Send Files Script"
echo "Before completing this, make sure a listener on the receiving machine is already set up"
echo "Are you sending more than 1 file? (Y/n or Enter):"
read multipleFiles

#sending multiple files
if [ $multipleFiles == "Y" ]; then
	echo "You will be sending all files in current directory"
	echo "Do you wish to continue? (Y/n or Enter):"
	read confirm

	if [ $confirm == "Y" ]; then
		echo "Sending all files in current directory $(pwd)"
		echo "Enter IP address of receiving machine:"
		read ipAddress
		echo "Enter port number of receiving machine:"
		read portNum
		tar cf - . | nc $ipAddress $portNum
		echo "File sent. You may now close out with CTRL+c" #this is put before the command because the command will hang until the receiver exits.
	else
		echo "Cancelling option. Script aborting"
	fi

#sending 1 file
elif [ $multipleFiles == "n" ] || [ -z $multipleFiles ]; then
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

