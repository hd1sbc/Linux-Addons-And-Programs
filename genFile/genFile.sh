#!/bin/bash

fileName=""

dropFileExtension () {
	fileName="${1%.*}$2"
}

if [ -z $1 ]; then
	echo "Too few arguments. Use '-h' or '--help' option for more details"
elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Generate File Help Menu"
	echo "Options:"
	echo "	-c		:- generates c file with extension .c"
	echo "	-cp,	--cpp 	:- generates c++ file with extension .cpp"
	echo "	-j,	--java	:- generates java file with extension .java"
	echo "	-p		:- generates perl file with extension .pl"
	echo ""
	echo "Usage:"
	echo "	genFileAlias -c <fileName>"
	echo""
	echo "Other Notes:"
	echo "	-All files are created in current working directory"
	echo "	-All files will automatically open in VIM"
	echo "	-You may only use one option at a time"
	echo "	-File extensions provided in the file name will be discarded"

elif [ "$1" == "-c" ]; then
	ext=".c"
	dropFileExtension $2 $ext
	if [ ! -f $fileName ]; then
		cat ~/myScripts/genFile/cMain.txt >> $fileName
		vim $fileName
	else
		echo "File already exists. No new file made"
	fi

elif [ "$1" == "-cp" ] || [ "$1" == "--cpp" ]; then
	ext=".cpp"
	dropFileExtension $2 $ext
	if [ ! -f $fileName ]; then
		cat ~/myScripts/genFile/cppMain.txt >> $fileName
		vim $fileName
	else
		echo "File already exists. No new file made"
	fi

elif [ "$1" == "--java" ] || [ "$1" == "-j" ]; then
	ext=".java"
	dropFileExtension $2 $ext
	if [ ! -f $fileName ]; then
		cat ~/myScripts/genFile/javaMain.txt >> $fileName
		vim $fileName
	else
		echo "File already exists. No new file made"
	fi

elif [ "$1" == "-p" ]; then
	ext=".p"
	dropFileExtension $2 $ext
	if [ ! -f $fileName ]; then
		cat ~/myScripts/genFile/pMain.txt >> $fileName
		vim $fileName
	else
		echo "File already exists. No new file made"
	fi

else
	echo "Invalid option. Type '-h' or '--help' for details"
fi

