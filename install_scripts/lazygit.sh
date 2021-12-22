#!/bin/bash
# SET TITLE OF SCRIPT TO PROGRAM TO INSTALL
echo "[${0##*/}] : INSTALLING >>>>>>>>>>>>>>>>"

# try
(
    set -e
    echo -e "${date} \n INSTALLING ${0##*/}"

    # PUT INSTALL COMMANDS HERE
    wget https://github.com/jesseduffield/lazygit/releases/download/v0.29/lazygit_0.29_Linux_x86_64.tar.gz
    tar -xzvf lazygit_0.29_Linux_x86_64.tar.gz
    rm lazygit_0.29_Linux_x86_64.tar.gz
    rm README.md LICENSE
    sudo mv lazygit /opt/
    sudo ln -sf /opt/lazygit /usr/bin/lazygit
    ln -sf $HOME/.dots/.config/lazygit $HOME/.config/lazygit

    echo -e "${date} \n INSTALLED ${0##*/}"
) >> /tmp/install_${0##*/}.log 2>&1
# catch
errorCode=$?
if [ $errorCode -ne 0 ]; then
    echo "[${0##*/}] : ERROR ----------------"

    # PUT CLEAN-UP COMMANDS HERE
    rm -f README.md LICENSE lazygit lazygit_0.29_Linux_x86_64.tar.gz

    exit $errorCode
fi

echo "[${0##*/}] : INSTALLED <<<<<<<<<<<<<<<<"
