#!/bin/bash
echo "Linux Boot - Adding functionality to your system"
currDir=$(pwd)
#creating myScripts file to sending 
if [ ! -d ~/myScripts ]; then
        mkdir ~/myScripts
fi
cd ~/myScripts
git clone https://github.com/79wwrdsl/Linux-Addons-And-Programs.git

#moving files out of git file into myScripts
for i in ~/myScripts/Linux-Addons-And-Programs.git/*; do
        mv $i ~/myScripts/
done
rm -r Linux-Addons-And-Programs.git
cd ~/myScripts
bash ~/myScripts/linuxBoot/linuxBoot.sh
rm -r ~/myScripts/linuxBoot/



