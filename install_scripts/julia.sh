#!/bin/bash
# SET TITLE OF SCRIPT TO PROGRAM TO INSTALL
echo "[${0##*/}] : INSTALLING >>>>>>>>>>>>>>>>"

# try
(
    set -e
    echo -e "${date} \n INSTALLING ${0##*/}"

    # PUT INSTALL COMMANDS HERE
    wget https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-1.6.2-linux-x86_64.tar.gz
    tar -xzvf julia-1.6.2-linux-x86_64.tar.gz
    rm julia-1.6.2-linux-x86_64.tar.gz
    sudo mv julia-1.6.2 /opt/
    sudo ln -sf /opt/julia-1.6.2/bin/julia /usr/bin/julia

    echo -e "${date} \n INSTALLED ${0##*/}"
) >> /tmp/install_${0##*/}.log 2>&1
# catch
errorCode=$?
if [ $errorCode -ne 0 ]; then
    echo "[${0##*/}] : ERROR ----------------"

    # PUT CLEAN-UP COMMANDS HERE
    sudo rm -f julia-1.6.2-linux-x86_64.tar.gz
    sudo rm -rf /opt/julia-1.6.2/
    sudo unlink /usr/bin/julia

    exit $errorCode
fi

echo "[${0##*/}] : INSTALLED <<<<<<<<<<<<<<<<"
