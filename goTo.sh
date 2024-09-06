#!/bin/bash

fileBool=0
dirBool=0
emptyBool=0
fileName=""
folderName=""

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "GoTo Help Menu:"
	echo "Description: enter a file or folder name and the program will open the file with vim or cd to the folder. Only works for files that are part of myScripts"
	echo "Options:"
	echo "	-f	:- only searches for file with that name"
	echo "	-d	:- only searches for folder with that name"
	echo "	[empty]	:- default. Will search for file. If no file is found, will try to find a folder"
	echo "You may only use one option at a time"
	echo "Example usage:"
	echo "	goToAlias -f <fileName>"
	echo "	goToAlias <fileName>"

elif [ "$1" == "-f" ]; then
	fileBool=1
elif [ "$1" == "-d" ]; then
	dirBool=1
elif [ -z $2 ]; then
	emptyBool=1
fi

#for every folder from the dependencies file
for i in $(cat ~/myScripts/dependencies/myFiles.txt); do
	if [ $emptyBool -eq 1 ]; then
		fileName=$(find $(eval echo $i) -name $1 -type f)
		if [ ! -z $fileName ]; then
			vim $fileName
			echo $fileName
			break
		else
			folderName=$(find $(eval echo $i) -name $1 -type d)
			if [ ! -z $folderName ]; then
				cd $folderName
				break
			fi
		fi
	elif [ $fileBool -eq 1 ]; then
		fileName=$(find $(eval echo $i) -name $2 -type f)
		if [ ! -z $fileName ]; then
			vim $fileName
			echo $fileName
			break
		fi
	elif [ $dirBool -eq 1 ]; then
		folderName=$(find $(eval echo $i) -name $2 -type d)
		if [ ! -z $folderName ]; then
			cd $folderName
			break
		fi
	fi
done

#comments if no files/folders were found. Putting at the end because there could be many folders to iterate through. If I put this in the for loop, it would check for each folder to look for
if [ -z $fileName ] && [ $fileBool -eq 1 ]; then
	echo "No file found with that name"
elif [ -z $folderName ] && [ $dirBool -eq 1 ]; then
	echo "No folder found with that name"
elif [ -z $fileName ] && [ -z $folderName ] && [ $emptyBool -eq 1 ]; then
	echo "No file or folder found with that name"
fi

