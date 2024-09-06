#!/bin/bash

echo "Do you intend to receive multiple files at the same time? (Y/n or Enter):"
read multipleFiles

#receiving multiple files
if [ $multipleFiles == "Y" ]; then
	echo "Select port number"
	read portNum
	nc -lv $portNum | tar xf -

#receiving 1 file
elif [ $multipleFiles == "n" ] || [ -z $multipleFiles ]; then
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

