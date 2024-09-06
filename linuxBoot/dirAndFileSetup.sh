#!/bin/bash

# make folder in home dir
if [ ! -d ~/myScripts ]; then
        mkdir ~/myScripts
fi
if [ ! -d ~/myScripts/compiledCode ]; then
        mkdir ~/myScripts/compiledCode
fi
if [ ! -d ~/myScripts/executeCode ]; then
        mkdir ~/myScripts/executeCode
fi

if [ ! -d ~/media ]; then
	mkdir ~/media
fi

#adding aliases
if [ ! -f ~/.bash_aliases ]; then
	mv .bash_aliases ~/
else
	echo .bash_aliases >> ~/.bash_aliases
	rm .bash_aliases
fi

#if using zsh shell or aliases are found in zshrc, then use append bash_aliases related text to ~/.zshrc
if [ $(echo $SHELL) == "/usr/bin/zsh" ]; then
        echo "if [ -f ~/.bash_aliases ]; then" >> ~/.zshrc
        echo "  . ~/.bash_aliases" >> ~/.zshrc
        echo "fi" >> ~/.zshrc
fi

#adding compiled folder
if [ ! -f ~/myScripts/compiledCode/compiledC ]; then
        cat << EOF > ~/myScripts/compiledCode/compiledC
EOF
        chmod 777 ~/myScripts/compiledCode/compiledC
fi
if [ ! -f ~/myScripts/compiledCode/compiledJava ]; then
	echo > ~/myScripts/compiledCode/compiledJava
	chmod 777 ~/myScripts/compiledCode/compiledJava
fi



#moving files to ~/myScripts <-- this was taken care of in linuxInit.sh

#setting up personal terminator configuration
if [ -f ~/.config/terminator/config ]; then #if there isn't a terminator config, that means the terminator app wasn't installed, so don't add this
	mv terminatorConfig config
	rm ~/.config/terminator/config 
	mv config ~/.config/terminator/
fi

#setting up vim key mappings
#editing /etc/vim/vimrc to use system vimrc default settings, but have user vimrc override those
sudo sed -i 's/^" source $VIMRUNTIME\/defaults\.vim.*$/source $VIMRUNTIME/defaults.vim/g' /etc/vim/vimrc 
#moving vimrc to the correct location
if [ -f ~/.vimrc ]; then
	rm ~/.vimrc
fi
mv ~/myScripts/linuxBoot/.vimrc ~/


