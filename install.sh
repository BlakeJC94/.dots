#!/bin/bash

function install_spotify() {
    # Source: https://www.spotify.com/us/download/linux/
    echo "---- [SPOTIFY] : INSTALL --------"
    echo "---------------------------------"
    # try
    (
        set -e
        curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
        echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
        sudo apt update && sudo apt install -y spotify-client
        mkdir -p $HOME/.local/share/keyrings
        ln -s $HOME/.dots/.spotify $HOME/.local/share/keyrings/spotify.keyring
        echo "---- [SPOTIFY] : DONE --------"
    )
    # catch
    errorCode=$?
    if [ $errorCode -ne 0 ]; then
        echo "---- [SPOTIFY] : ERROR --------"
        exit $errorCode
    fi
}

# function install_alacritty() {
#     # Source: https://www.spotify.com/us/download/linux/
#     echo "---- [ALACRITTY] : INSTALL --------"
#     echo "-----------------------------------"
#     # try
#     (
#         set -e
#         sudo add-apt-repository -y ppa:aslatter/ppa
#         sudo apt install -y alacritty
#         echo "---- [ALACRITTY] : DONE --------"
#     )
#     # catch
#     errorCode=$?
#     if [ $errorCode -ne 0 ]; then
#         echo "---- [ALACRITTY] : ERROR --------"
#         exit $errorCode
#     fi
# }

function install_neovim(){
    echo "---- [NEOVIM] : INSTALL --------"
    echo "--------------------------------"
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
        echo "---- [NEOVIM] : DONE --------"
    )
    # catch
    errorCode=$?
    if [ $errorCode -ne 0 ]; then
        echo "---- [NEOVIM] : ERROR --------"
        exit $errorCode
    fi
}

function install_zotero() {
    # Source: https://github.com/retorquere/zotero-deb
    # Source: https://forums.zotero.org/discussion/83039/appimage-for-linux
    # Source: https://www.zotero.org/download/
    echo "--------------------------------"
    echo "---- [ZOTERO] : INSTALL --------"
    #try
    (
        set -e
        wget -qO- https://github.com/retorquere/zotero-deb/releases/download/apt-get/install.sh | sudo bash
        sudo apt update
        sudo apt install zotero
        # Make sure storage is symlinked
        mkdir -p $HOME/.local/share/zotero
        ln -s $HOME/Dropbox/Apps/Zotero/storage $HOME/.local/share/zotero/storage
        echo "---- [ZOTERO] : DONE --------"
    )
    # catch
    errorCode=$?
    if [ $errorCode -ne 0 ]; then
        echo "---- [ZOTERO] : ERROR --------"
        exit $errorCode
    fi
}

function install_dropbox() {
    # Source: https://www.techrepublic.com/article/how-to-install-and-run-dropbox-from-a-headless-linux-server/
    echo "---------------------------------"
    echo "---- [DROPBOX] : INSTALL --------"
    #try
    (
        set -e
        sudo apt install python3-gpg
        cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
        cd ~ && wget -O - "https://linux.dropbox.com/packages/dropbox.py"
        sudo mv ~/dropbox.py /opt/
        sudo chmod +x /opt/dropbox.py
        sudo ln -s /opt/dropbox.py /usr/bin/dropbox
        ~/.dropbox-dist/dropboxd &
        echo -e "\n[DROPBOX] : Started Dropbox, login at browser then press any key to continue.\n"

        read -n 1 k <&1
        echo -e "\n[DROPBOX] : Waiting for sync to start before adding exclusions.\n"

        sleep 20
        dropbox exclude add Dropbox/Archived/
        echo -e "\n[DROPBOX] : Double check sync exlusions and run linkscript.\n"
    )
    # catch
    errorCode=$?
    if [ $errorCode -ne 0 ]; then
        echo "---- [DROPBOX] : ERROR --------"
        exit $errorCode
    fi
}

function link_dotfiles() {
    echo "----------------------------------"
    echo "---- [DOTFILES] : LINKING --------"
    #try
    (
        set -e
        DOTFILEDIR=$HOME/.dots

        FILES=( .bashrc .bash_prompt .xinitrc .vimrc .gitconfig .gitignore .alacritty.yml .config/nvim .config/zathura .config/kitty/ )
        for i in "${FILES[@]}"; do
            if [ -f "$HOME/$i" ]; then
                echo "$i exists"
                mv $HOME/$i $HOME/$i.bak
            fi
            echo "Creating link for $i"
            ln -sf $DOTFILEDIR/$i $HOME/$i
        done

        DIRS=( .config/nvim .config/zathura .config/kitty )
        for i in "${DIRS[@]}"; do
            if [ -f "$HOME/$i" ]; then
                echo "$i exists"
                mv $HOME/$i $HOME/$i.bak
            fi
            echo "Creating link for $i"
            ln -sf $DOTFILEDIR/$i/ $HOME/$i
        done
    )
    # catch
    errorCode=$?
    if [ $errorCode -ne 0 ]; then
        echo "---- [DOTFILES] : ERROR --------"
        exit $errorCode
    fi
}

function install_chtsh() {
    echo "------------------------------"
    echo "---- [CHT.SH] INSTALL --------"
    #try
    (
        set -e
        curl https://cht.sh/:cht.sh > $HOME/.local/bin/cht.sh
        chmod +x $HOME/.local/bin/cht.sh
        ln -s $HOME/.local/bin/cht.sh $HOME/.local/bin/ch
        echo "---- [CHT.SH] DONE  --------"
    )
    # catch
    errorCode=$?
    if [ $errorCode -ne 0 ]; then
        echo "---- [CHT.SH] ERROR --------"
        exit $errorCode
    fi
}

function install_apt_tools(){
    echo "--------------------------------------"
    echo "---- [APT TOOLS] : INSTALLING --------"
    sudo apt install -y kitty tldr tree neofetch fzf zathura zathura-djvu zathura-ps
    sudo apt install -y python3-pip python3-venv python3-setuptools python3-dev
    sudo apt install -y lua5.1 npm ripgrep ipython3 clang-format unclutter-xfixes
    sudo python3 -m pip install thefuck pynvim
    echo "---- [APT TOOLS] : DONE --------"
}

echo "====================================="
echo "==== [INSTALL.SH] : STARTING ========"
echo "====================================="

# install_chtsh
# install_alacritty
# install_neovim
# # install_dropbox
# install_spotify
# # install_zotero  # UNTESTED, ENSURE DROPBOX IS SYNCED FIRST
link_dotfiles

echo "================================="
echo "==== [INSTALL.SH] : DONE ========"
echo "================================="

