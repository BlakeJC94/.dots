#!/usr/bin/bash

# FILES=( .bashrc .bash_prompt .vimrc .gitconfig .gitignore .alacritty.yml .config/nvim .config/zathura )
DOTFILEDIR=$HOME/.dots

for i in "${FILES[@]}"; do
    if [ -f "$HOME/$i" ]; then
        echo "$i exists"
        mv $HOME/$i $HOME/$i.bak
    fi
    echo "Creating link for $i"
    ln -sf $DOTFILEDIR/$i $HOME/$i
done
