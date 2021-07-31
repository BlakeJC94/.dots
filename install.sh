#!/bin/bash

function install_spotify() {
    # Source: https://www.spotify.com/us/download/linux/
    # try
    (
        set -e
        curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
        echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
        sudo apt update && sudo apt install -y spotify-client
        mkdir -p $HOME/.local/share/keyrings
        ln -s $HOME/.dots/.spotify $HOME/.local/share/keyrings/spotify.keyring
    )
    # catch
    errorCode=$?
    if [ $errorCode -ne 0 ]; then
      echo "install_spotify error occured:"
      exit $errorCode
    fi
}

function install_alacritty() {
    # Source: https://www.spotify.com/us/download/linux/
    # try
    (
        set -e
        sudo add-apt-repository -y ppa:aslatter/ppa
        sudo apt install -y alacritty
    )
    # catch
    errorCode=$?
    if [ $errorCode -ne 0 ]; then
      echo "install_alacritty error occured:"
      exit $errorCode
    fi
}

function install_neovim(){
    # WORKING
    # try
    (
        set -e
        wget https://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage
        chmod u+x nvim.appimage
        sudo mv nvim.appimage /opt/
        sudo ln -sf /opt/nvim.appimage /usr/bin/vim
        # Install vim-plug
        curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        # Configure clang
        clang-format -style=webkit -dump-config > .clang-format
        echo "install_neovim passed!"
    )
    # catch
    errorCode=$?
    if [ $errorCode -ne 0 ]; then
      echo "install_neovim error occured:"
      exit $errorCode
    fi
}

function install_zotero() {
    # Source: https://github.com/retorquere/zotero-deb
    # Source: https://forums.zotero.org/discussion/83039/appimage-for-linux
    # Source: https://www.zotero.org/download/
    #try
    (
        set -e
        wget -qO- https://github.com/retorquere/zotero-deb/releases/download/apt-get/install.sh | sudo bash
        sudo apt update
        sudo apt install zotero
        # Make sure storage is symlinked
        mkdir -p $HOME/.local/share/zotero
        ln -s $HOME/Dropbox/Apps/Zotero/storage $HOME/.local/share/zotero/storage
    )
    # catch
    errorCode=$?
    if [ $errorCode -ne 0 ]; then
      echo "install_zotero error occured:"
      exit $errorCode
    fi
}

function install_dropbox() {
    # Source: https://www.techrepublic.com/article/how-to-install-and-run-dropbox-from-a-headless-linux-server/
    #try
    (
        set -e
        wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb
        sudo dpkg -i dropbox_2020.03.04_amd64.deb
        sudo apt install python3-gpg
        dropbox
        echo "DROPBOX: SIGN IN AND SET UP SYNC EXCLUSIONS"
    )
    # catch
    errorCode=$?
    if [ $errorCode -ne 0 ]; then
      echo "install_dropbox error occured:"
      exit $errorCode
    fi
}

# echo "==== INSTALLING APT TOOLS ========"
sudo apt install -y tldr tree neofetch fzf zathura zathura-djvu zathura-ps
sudo apt install -y python3-pip python3-venv python3-setuptools python3-dev
sudo apt install -y lua5.4 npm ripgrep ipython3 clang-format unclutter-xfixes
sudo python3 -m pip install thefuck pynvim

ln -s $HOME/.dots/.local/bin/wat $HOME/.local/bin/wat
chmod u+x $HOME/.local/bin/wat
ln -s $HOME/.dots/.local/bin/watt $HOME/.local/bin/watt
chmod u+x $HOME/.local/bin/watt
ln -s $HOME/.dots/.local/bin/mann $HOME/.local/bin/mann
chmod u+x $HOME/.local/bin/mann

curl https://cht.sh/:cht.sh > $HOME/.local/bin/cht.sh
chmod +x $HOME/.local/bin/cht.ch
ln -s $HOME/.local/bin/cht.sh $HOME/.local/bin/ch
chmod +x $HOME/.local/bin/ch


# echo "==== INSTALLING ALACRITTY ========"
# install_alacritty

# echo "==== INSTALLING NEOVIM ========"
# install_neovim

# echo "==== INSTALLING DROPBOX ========"
# install_dropbox

echo "==== INSTALLING SPOTIFY ========"
install_spotify

# # UNTESTED, ENSURE DROPBOX IS INSTALLED FIRST
# echo "==== INSTALLING ZOTERO ========"
# install_zotero
