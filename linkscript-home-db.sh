#!/usr/bin/bash
# Script to remove each local folder and replace them
#   with links to Dropbox folders
#
# ONLY USE THIS IF DROPBOX IS INSTALLED AND LOCAL DIRS ARE EMPTY

DIRS=( Desktop Documents Music Pictures Videos Public  )
WORKDIRS=( applications devices languages scratchpad dotfiles )

for DIR in "${DIRS[@]}"; do
    echo "Replacing $DIR"
    mv $HOME/$DIR $HOME/.$DIR.bak
    ln -sf $HOME/Dropbox/Home-db/$DIR-db $HOME/$DIR
done

echo "Setting up Workspace"
mkdir -p $HOME/Workspace/local/data
mkdir -p $HOME/Workspace/local/projects
mkdir -p $HOME/Workspace/local/latex
for DIR in "${WORKDIRS[@]}"; do
    ln -sf $HOME/Dropbox/Home-db/Workspace-db/$DIR $HOME/Workspace/$DIR
done
