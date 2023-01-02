# sudo apt install python3-gpg

wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - --directory=$HOME
curl "https://linux.dropbox.com/packages/dropbox.py" -o "$HOME/.local/opt/dropbox.py"

if ! [[ "$(command -v dropbox)" ]]; then
    chmod +x $HOME/.local/opt/dropbox.py
    ln -s $HOME/.local/opt/dropbox.py $HOME/.local/bin/dropbox
fi

echo "------------------------------------------------------------"
echo "NOTE: don't forget to log into dropbox and run 'dropbox.sh'."


