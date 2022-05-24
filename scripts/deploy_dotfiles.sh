#!/bin/bash
mkdir -p $HOME/.local/bin
DOTFILES=( .bashrc .bash_prompt .bash_aliases .xinitrc .gitconfig .gitignore .config/zathura .config/kitty .config/ncspot )
for i in "${DOTFILES[@]}"; do
    if [ -f "$HOME/$i" ]; then
        mv $HOME/$i $HOME/$i.dotsinstall.bak
    fi
    ln -sf $HOME/.dots/$i $HOME/$i
done

