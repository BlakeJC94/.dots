#!/bin/bash
sudo apt install python3-gpg

sudo wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - --directory=~
sudo curl "https://linux.dropbox.com/packages/dropbox.py" -o "$HOME/.local/dropbox.py"

if ! [[ "$(command -v dropbox)" ]]; then
    sudo chmod +x $HOME/.local/dropbox.py
    sudo ln -s $HOME/.local/dropbox.py $HOME/.local/bin/dropbox
fi

echo "------------------------------------------------------------"
echo "NOTE: don't forget to log into dropbox and run 'dropbox.sh'."


