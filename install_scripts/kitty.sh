#!/bin/bash
# SET TITLE OF SCRIPT TO PROGRAM TO INSTALL
echo "[${0##*/}] : INSTALLING >>>>>>>>>>>>>>>>"

DOTFILES=( .bashrc .bash_prompt .xinitrc .gitconfig .gitignore )
# try
(
    set -e
    echo -e "${date} \n INSTALLING ${0##*/}"

    # PUT INSTALL COMMANDS HERE
    sudo apt install -y kitty unclutter-xfixes

    ln -sf $HOME/.dots/.fonts $HOME/.fonts
    ln -sf $HOME/.dots/.config/kitty $HOME/.config/kitty

    for i in "${DOTFILES[@]}"; do
        if [ -f "$HOME/$i" ]; then
            mv $HOME/$i $HOME/$i.bak
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
    unlink $HOME/.fonts
    unlink $HOME/.config/kitty

    for i in "${DOTFILES[@]}"; do
        unlink $HOME/$i
        if [ -f "$HOME/$i.bak" ]; then
            mv $HOME/$i.bak $HOME/$i
        fi
    done

    exit $errorCode
fi

echo "[${0##*/}] : INSTALLED <<<<<<<<<<<<<<<<"
