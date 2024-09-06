#!/bin/bash
source ~/myScripts/ghubConnect/ghubConfig.sh

trap "unsetGitConfig; exit" SIGINT

setGitConfig

echo "Enter GitHub link:"
read ghubLink
echo "Enter the path to the folder you want the clone to reside (press Enter for current directory):"
read dir
echo "Do you want to move the files out of the cloned folder? (Y/n)"
echo "	You can also just press Enter for yes"
read moveFiles


if [ ! -z $dir ]; then
	cd $dir
fi

git clone $ghubLink

if [ -z "$moveFiles" ] || [ $moveFiles == "Y" ]; then
	numFields=$(echo $ghubLink | awk -F'/' '{print NF}')
	ghubNameTmp=$(echo $ghubLink | cut -d '/' -f $numFields)
	ghubRepoFolderName=$(echo $ghubNameTmp | cut -d '.' -f 1)
	if [ ! -d "$ghubRepoFolderName" ]; then
		echo "Folder doesn't exist"
	else
		for i in $ghubRepoFolderName/*; do
			mv $i .
		done
	fi
elif [ ! $moveFiles == "n" ]; then
	echo "Invalid option. Please select 'Y' or 'n'."
fi

unsetGitConfig


