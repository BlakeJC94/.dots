#!/bin/bash
# SET TITLE OF SCRIPT TO PROGRAM TO INSTALL
echo "[${0##*/}] : INSTALLING >>>>>>>>>>>>>>>>"

# try
(
    set -e
    echo -e "${date} \n INSTALLING ${0##*/}"

    # PUT INSTALL COMMANDS HERE
    sudo apt install -y lua5.1 npm ripgrep python3-pip
    sudo python3 -m pip install pynvim
    wget https://github.com/neovim/neovim/releases/download/v0.5.0/nvim-linux64.tar.gz
    tar -xzf nvim-linux64.tar.gz
    rm nvim-linux64.tar.gz
    sudo mv nvim-linux64 /opt
    sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/bin/nvim
    sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/bin/vim
    ln -sf $HOME/.dots/.config/nvim $HOME/.config/nvim

    echo -e "${date} \n INSTALLED ${0##*/}"
) >> /tmp/install_${0##*/}.log 2>&1
# catch
errorCode=$?
if [ $errorCode -ne 0 ]; then
    echo "[${0##*/}] : ERROR ----------------"

    # PUT CLEAN-UP COMMANDS HERE
    rm -f nvim-linux64.tar.gz
    rm -rf nvim-linux64/
    sudo rm -f /opt/nvim-linux64/
    sudo unlink /usr/bin/nvim
    sudo unlink /usr/bin/vim
    sudo unlink $HOME/.config/nvim

    exit $errorCode
fi

echo "[${0##*/}] : INSTALLED <<<<<<<<<<<<<<<<"
