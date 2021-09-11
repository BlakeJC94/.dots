#!/bin/bash
# SET TITLE OF SCRIPT TO PROGRAM TO INSTALL
echo "[${0##*/}] : INSTALLING >>>>>>>>>>>>>>>>"

# Source: https://github.com/retorquere/zotero-deb
# Source: https://forums.zotero.org/discussion/83039/appimage-for-linux
# Source: https://www.zotero.org/download/

# try
(
    set -e
    echo -e "${date} \n INSTALLING ${0##*/}"

    # PUT INSTALL COMMANDS HERE
    wget -qO- https://github.com/retorquere/zotero-deb/releases/download/apt-get/install.sh | sudo bash
    sudo apt update
    sudo apt install zotero
    # # Make sure storage is symlinked
    # mkdir -p $HOME/.local/share/zotero
    # ln -s $HOME/Dropbox/Apps/Zotero/storage $HOME/.local/share/zotero/storage

    echo -e "${date} \n INSTALLED ${0##*/}"
) >> /tmp/install_${0##*/}.log 2>&1
# catch
errorCode=$?
if [ $errorCode -ne 0 ]; then
    echo "[${0##*/}] : ERROR ----------------"

    # PUT CLEAN-UP COMMANDS HERE
    # ...

    exit $errorCode
fi

echo "[${0##*/}] : INSTALLED <<<<<<<<<<<<<<<<"
