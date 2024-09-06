#!/bin/bash

setGitConfig () {
	source ~/myScripts/dependencies/private.sh

	#git config
	if [[ $(git config --global --list) == "" ]]; then
		git config --global user.name "$ghubUname"
		git config --global user.email "$ghubEmail"
		git config --global user.password "$ghubTick"
	fi

	sudo git config --global credential.helper store
	git config --global credential.helper cache
}



unsetGitConfig () {
	#unsetting global variables
	git config --global --unset user.name
	git config --global --unset user.email
	git config --global --unset user.password
	sudo git config --global --unset credential.helper
	> ~/.gitconfig
	> ~/.git-credentials

	if [[ $(git config --global --list) != "" ]]; then
		echo "Global variables not unset. Username and email are still visible."
		echo "It is recommended to unset these items."
		echo "git config --global --unset user.name"
		echo "git config --global --unset user.email"
	fi
}
