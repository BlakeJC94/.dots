#!/bin/bash
# SET TITLE OF SCRIPT TO PROGRAM TO INSTALL
echo "[${0##*/}] : INSTALLING >>>>>>>>>>>>>>>>"

DOTFILES=( .bashrc .bash_prompt .bash_aliases .xinitrc .gitconfig .gitignore )
# try
(
    set -e
    echo -e "${date} \n INSTALLING ${0##*/}"

    # PUT INSTALL COMMANDS HERE
    sudo apt install -y tldr tree exa bat qt5-style-plugins unclutter-xfixes

    for i in "${DOTFILES[@]}"; do
        if [ -f "$HOME/$i" ]; then
            mv $HOME/$i $HOME/$i.dotsinstall.bak
        fi
        ln -sf $HOME/.dots/$i $HOME/$i
    done

    echo -e "${date} \n INSTALLED ${0##*/}"
) >> /tmp/install_${0##*/}.log 2>&1
# catch
errorCode=$?
if [ $errorCode -ne 0 ]; then
    echo "[${0##*/}] : ERROR ----------------"

    # PUT CLEAN-UP COMMANDS HERE
    for i in "${DOTFILES[@]}"; do
        unlink $HOME/$i
        if [ -f "$HOME/$i.dotsinstall.bak" ]; then
            mv $HOME/$i.dotsinstall.bak $HOME/$i
        fi
    done

    exit $errorCode
fi

echo "[${0##*/}] : INSTALLED <<<<<<<<<<<<<<<<"
