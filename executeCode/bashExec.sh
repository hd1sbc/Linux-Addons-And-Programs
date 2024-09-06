fileType=$(python3 ~/myScripts/executeCode/fileType.py $1)
if [ -z $fileType ]; then
	echo "File doesn't exist or file type (based on extension) is not supported"
elif [ $fileType == "sh" ]; then
	bash $@
elif [ $fileType == "c" ]; then
	args=$(echo $@ | cut -d ' ' -f2-) #getting the arguments, excluding the name of the file
	gcc $1 -o ~/myScripts/compiledCode/compiledC
	~/myScripts/compiledCode/compiledC $args
elif [ $fileType == "pl" ]; then
	perl $@
elif [ $fileType == "rb" ]; then
	ruby $@
elif [ $fileType == "cpp" ]; then
	args=$(echo $@ | cut -d ' ' -f2-) #getting the arguments, excluding the name of the file
	gcc $1 -o ~/myScripts/compiledCode/compiledCPP
	~/myScripts/compiledCode/compiledCPP $args
elif [ $fileType == "py" ]; then
	python3 $@
elif [ $fileType == "java" ]; then
	args=$(echo $@ | cut -d ' ' -f2-) #getting the arguments, excluding the name of the file
	javac $1 -d ~/myScripts/compiledCode/compiledJava
	java ~/myScripts/compiledCode/compiledJava $args
fi
