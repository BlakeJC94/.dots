#!/bin/bash
# Try-Catch in bash, suggested by https://stackoverflow.com/a/46597567

function install_tools_apt() {
    sudo apt install tldr tree neofetch fzf python3-pip python3-venv lua5.4 npm
}

function install_spotify() {
    # Source: https://www.spotify.com/us/download/linux/
    curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt update && sudo apt install spotify-client
}

function install_alacritty() {
    # Source: https://ubuntuhandbook.org/index.php/2020/12/install-alacritty-ppa-ubuntu-20-04/
    # Source: https://github.com/alacritty/alacritty/blob/master/INSTALL.md#debianubuntu
    sudo add-apt-repository ppa:aslatter/ppa
    sudo apt install alacritty
}

function install_zotero() {
    # Source: https://github.com/retorquere/zotero-deb
    # Source: https://forums.zotero.org/discussion/83039/appimage-for-linux
    # Source: https://www.zotero.org/download/
    wget -qO- https://github.com/retorquere/zotero-deb/releases/download/apt-get/install.sh | sudo bash
    sudo apt update
    sudo apt install zotero
    # Make sure storage is symlinked
    mkdir -p $HOME/.local/share/zotero
    ln -s $HOME/Dropbox/Apps/Zotero/storage $HOME/.local/share/zotero/storage
}

function install_appimagelauncher() {
    wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
    sudo dpkg -i appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
    rm appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
}

function install_nvim(){
    wget https://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage
    chmod u+x nvim.appimage
    sudo mv nvim.appimage /opt/
    sudo ln -s nvim.appimage /usr/bin/nvim
    ln -s $HOME/Dropbox/Home-db/Workspace-db/dotfiles/.config/nvim $HOME/.config/nvim
}


# try -------------------------------------------------------------------------
(
    # this flag will make to exit from current subshell on any error
    # inside it (all functions run inside will also break on any error)
    set -e
    install_alacritty
    install_tools_apt
    install_spotify
    install_zotero
    # install_appimagelauncher
    install_nvim
)
# catch -----------------------------------------------------------------------
errorCode=$?
if [ $errorCode -ne 0 ]; then
  echo "We have an error"
  # We exit the all script with the same error, if you don't want to
  # exit it and continue, just delete this line.
  exit $errorCode
fi
# -----------------------------------------------------------------------------

cat <<EOF
ZOTERO INSTALLATION EXTRA STEPS:

  - <Edit/Preferences> Zotero preferences
    - <Sync> Sign in to Zotero account and disable file syncing
    - <Advanced/Files and Folders>
      - Data Directory location: `/home/blake/.local/share/zotero`

  # NOTE THIS MIGHT NOT BE NEEDED, JUST DELETE IT?
  - Manually move default zotero stuff over (except for storage)
      `$ rm -r $HOME/Zotero/storage`
      `$ mv $HOME/Zotero/* $HOME/.local/share/zotero/`
      `$ rm -r $HOME/Zotero`

  - Download and install Better BibTeX add-on for Zotero

EOF
