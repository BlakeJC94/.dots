cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
mkdir -p ~/.local/bin
wget https://linux.dropbox.com/packages/dropbox.py -O ~/.local/bin/dropbox
chmod a+x ~/.local/bin/dropbox

