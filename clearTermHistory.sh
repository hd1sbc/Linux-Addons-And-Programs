#!/bin/bash

if [ $(echo $SHELL) == "/usr/bin/zsh" ]; then
	echo -n "" > ~/.zsh_history
	HISTSIZE=0
	if [ -f ~/.bash_history ]; then
		echo -n "" > ~/.bash_history
	fi
	echo "History cleared. You may now exit"

elif [ $(echo $SHELL) == "/bin/bash" ]; then
	history -c
	#> ~/.bash_history
	#unset HISTFILE
	echo "History cleared. You may now exit"
else
	echo "Shell not compatible with program"
fi

