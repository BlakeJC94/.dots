#!/bin/bash
# SET TITLE OF SCRIPT TO PROGRAM TO INSTALL
echo "[${0##*/}] : INSTALLING >>>>>>>>>>>>>>>>"

# try
(
    set -e
    echo -e "${date} \n INSTALLING ${0##*/}"

    # PUT INSTALL COMMANDS HERE
    sudo apt install python3-gpg
    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    cd ~ && wget -O - "https://linux.dropbox.com/packages/dropbox.py"
    sudo mv ~/dropbox.py /opt/
    sudo chmod +x /opt/dropbox.py
    sudo ln -s /opt/dropbox.py /usr/bin/dropbox

    echo -e "${date} \n INSTALLED ${0##*/}"
) >> /tmp/install_${0##*/}.log 2>&1
# catch
errorCode=$?
if [ $errorCode -ne 0 ]; then
    echo "[${0##*/}] : ERROR ----------------"

    # PUT CLEAN-UP COMMANDS HERE
    rm -f $HOME/dropbox.py
    rm -f /opt/dropbox.py
    rm -rf $HOME/.dropbox-dist

    exit $errorCode
fi

$HOME/.dropbox-dist/dropboxd &
echo -e "[${0##*/}] : Started Dropbox, login at browser then press any key to continue."
read -n 1 k <&1
echo -e "\n[${0##*/}] : Waiting for sync to start before adding exclusions."
sleep 20
dropbox exclude add Dropbox/Archived/
echo -e "\n[${0##*/}] : Double check sync exlusions, startup options, and run linkscript."

echo "[${0##*/}] : INSTALLED <<<<<<<<<<<<<<<<"
