#!/bin/bash
echo "Do you want updates and installations (Y/n):"
read yn
if [ $yn == "Y" ]; then
	#checking to make sure user is root. If not, exit
	if [ $(whoami) != "root" ]; then
		echo "switch to root user using command: sudo su -"
	else #if user is root
		bash systemUpgrades.sh
		
		#directory and file setup with option for pentesting automation
		echo "Do you want to include pentesting automation functionality? (Y/n):"
		read ptAuto
		if [ $ptAuto == "Y" ]; then
			bash dirAndFileSetup.sh
			git clone https://github.com/79wwrdsl/PenTest-Automation.git
			mv PenTest-Automation/ptestAuto ~/myScripts/
			mv naughtyAliases.sh ~/myScripts/dependencies/aliases/
			rm -r PenTest-Automation
		elif [ $ptAuto == "n" ]; then
			bash dirAndFileSetup.sh
		else
			echo "Incorrect option chosen. Please select either 'Y' or 'n'"
		fi
		
	fi
elif [ $yn == "n" ]; then
	
	#directory and file setup with option for pentesting automation
	echo "Do you want to include pentesting automation functionality? (Y/n):"
	read ptAuto
	if [ $ptAuto == "Y" ]; then
		bash dirAndFileSetup.sh
		git clone https://github.com/79wwrdsl/PenTest-Automation.git
		mv PenTest-Automation/ptestAuto ~/myScripts/
		rm -r PenTest-Automation
	elif [ $ptAuto == "n" ]; then
		bash dirAndFileSetup.sh
	else
		echo "Incorrect option chosen. Please select either 'Y' or 'n'"
	fi

else
	echo "Incorrect option chosen. Please select either 'Y' or 'n'"
fi

cat <<EOF > ~/myScripts/dependencies/private
EOF


#Possible programs to install
#	Nessus/Tenable