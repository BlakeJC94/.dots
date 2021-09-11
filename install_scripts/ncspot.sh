#!/bin/bash
echo "[${0##*/}] : INSTALLING >>>>>>>>>>>>>>>>"

# try
(
    set -e
    echo -e "${date} \n INSTALLING ${0##*/}"

    # PUT INSTALL COMMANDS HERE
    wget https://github.com/hrkfdn/ncspot/releases/download/v0.8.2/ncspot-v0.8.2-linux.tar.gz
    tar -xzvf ncspot-v0.8.2-linux.tar.gz
    sudo mv ncspot /opt/
    rm ncspot-v0.8.2-linux.tar.gz
    ln -sf $HOME/.dots/.config/ncspot $HOME/.config/ncspot

    echo -e "${date} \n INSTALLED ${0##*/}"
) >> /tmp/install_${0##*/}.log 2>&1
# catch
errorCode=$?
if [ $errorCode -ne 0 ]; then
    echo "[${0##*/}] : ERROR ----------------"

    # PUT CLEAN-UP COMMANDS HERE
    rm -f ncspot-v0.8.2-linux.tar.gz
    rm -f ncspot
    rm -f /opt/ncspot
    unlink $HOME/.config/ncspot

    exit $errorCode
fi

echo "[${0##*/}] : INSTALLED <<<<<<<<<<<<<<<<"

