#!/bin/bash
# SET TITLE OF SCRIPT TO PROGRAM TO INSTALL
echo "[${0##*/}] : INSTALLING >>>>>>>>>>>>>>>>"

# try
(
    set -e
    echo -e "${date} \n INSTALLING ${0##*/}"

    # PUT INSTALL COMMANDS HERE
    wget https://downloads.slack-edge.com/releases/linux/4.19.2/prod/x64/slack-desktop-4.19.2-amd64.deb
    dpkg -i slack-desktop-4.19.2-amd64.deb
    rm slack-desktop-4.19.2-amd64.deb

    mkdir -p $HOME/.local/share/keyrings
    ln -s $HOME/.dots/.slack $HOME/.local/share/keyrings/slack.keyring

    echo -e "${date} \n INSTALLED ${0##*/}"
) >> /tmp/install_${0##*/}.log 2>&1
# catch
errorCode=$?
if [ $errorCode -ne 0 ]; then
    echo "[${0##*/}] : ERROR ----------------"

    # PUT CLEAN-UP COMMANDS HERE
    rm -f slack-desktop-4.19.2-amd64.deb
    unlink $HOME/.local/share/keyrings/slack.keyring

    exit $errorCode
fi

echo "[${0##*/}] : INSTALLED <<<<<<<<<<<<<<<<"
