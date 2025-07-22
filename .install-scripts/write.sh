wget https://www.styluslabs.com/download/write-tgz
mkdir -p ~/.local/opt
mv write-latest.tar.gz ~/.local/opt
cd ~/.local/opt
tar xzfv write-latest.tar.gz
cd Write
sudo ./setup.sh
xdg-mime default Write.desktop image/svg+xml

