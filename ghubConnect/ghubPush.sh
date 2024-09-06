#!/bin/bash
source ~/myScripts/ghubConnect/ghubConfig.sh

trap "unsetGitConfig; exit" SIGINT

setGitConfig

echo "Enter file name (and path) to upload:"
read file
git add $file
git commit
git push

unsetGitConfig

