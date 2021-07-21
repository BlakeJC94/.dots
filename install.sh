#!/bin/bash

function install_spotify() {
    # Source: https://www.spotify.com/us/download/linux/
    # try
    (
        set -e
        curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
        echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
        sudo apt update && sudo apt install -y spotify-client
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
    # try
    (
        set -e
        wget https://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage
        chmod u+x nvim.appimage
        sudo mv nvim.appimage /opt/
        sudo ln -s nvim.appimage /usr/bin/vim
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
# sudo apt install -y tldr tree neofetch fzf python3-pip python3-venv lua5.4 npm

echo "==== INSTALLING ALACRITTY ========"
install_alacritty

echo "==== INSTALLING NEOVIM ========"
install_neovim

echo "==== INSTALLING DROPBOX ========"
install_dropbox

echo "==== INSTALLING SPOTIFY ========"
install_spotify

# # UNTESTED, ENSURE DROPBOX IS INSTALLED FIRST
# echo "==== INSTALLING ZOTERO ========"
# install_zotero
