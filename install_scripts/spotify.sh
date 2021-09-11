#!/bin/bash
# SET TITLE OF SCRIPT TO PROGRAM TO INSTALL
echo "[${0##*/}] : INSTALLING >>>>>>>>>>>>>>>>"

# Source: https://www.spotify.com/us/download/linux/
# try
(
    set -e
    echo -e "${date} \n INSTALLING ${0##*/}"

    # PUT INSTALL COMMANDS HERE
    curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt update && sudo apt install -y spotify-client
    mkdir -p $HOME/.local/share/keyrings
    ln -s $HOME/.dots/.spotify $HOME/.local/share/keyrings/spotify.keyring

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
