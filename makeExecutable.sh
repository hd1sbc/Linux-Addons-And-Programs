#!/bin/bash

loop () {
	dir=$(find $1 -type d)
	currFiles=$(find $1 -type f)
	if [ ! -z "$tmpDir" ]; then
		for i in $tmpDir; do
			loop $i
		done		
	fi
	
	if [ ! -z "$currFiles" ]; then
		for i in $currFiles; do
			chmod +x $i
		done
	fi
}

if [ -z $1 ]; then
	loop ~/myScripts
elif [ $1 == "-h" ] || [ $1 == "--help" ]; then
	echo "Make Executable Script Help Menu"
	echo "Description: will make all files from all subdirectories of a given folder (default is ~/myScripts) executable"
	echo "Options:"
	echo "	<empty>			:- default. Will loop through all files in ~/myScripts folder"
	echo "	-<dirName>		:- will loop through all files from specified directory"
else
	loop $1
fi

