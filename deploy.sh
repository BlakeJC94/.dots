#!/usr/bin/env bash

mkdir -p ${HOME}/.local/bin
mkdir -p ${HOME}/.local/opt

source $HOME/.dots/scripts/link.sh

echo "TODO fix rest of deploy script"

# # Check if sudo was used
# if [[ $(id -u) -ne 0 ]] ; then
#     echo "Please run as root to update packages." ;
#     exit 1
# fi

# # Use non-interactive sudo and patch `$HOME`
# sudo -n true
# HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

# echo "============"
# echo "Updating apt"
# source ./scripts/install/apt.sh

# echo "================"
# echo "Updating flatpak"
# source ./scripts/install/flatpak.sh

# echo "=============="
# echo "Updating pyenv"
# source ./scripts/install/pyenv.sh

# echo "============"
# echo "Updating pip"
# source ./scripts/install/pip.sh

# echo "============"
# echo "Updating npm"
# source ./scripts/install/npm.sh

# echo "============="
# echo "Updating brew"
# source ./scripts/install/brew.sh

# # TODO aws-sso
# echo "======================="
# echo "Updating work utilities"
# source ./update/work.sh

# echo "================="
# echo "Installing ncspot"
# source ./scripts/install/ncspot.sh

# # echo "=============="
# echo "Updating Julia"
# source ./scripts/install/julia.sh

# echo "================"
# echo "Installing fonts"
# source ./scripts/install/fonts.sh

# echo "================"
# echo "Installing kitty"
# source ./scripts/install/kitty.sh

# echo "================="
# echo "Installing neovim"
# source ./scripts/install/neovim.sh

# echo "=================="
# echo "Installing dropbox"
# source ./scripts/install/dropbox.sh

# echo "====="
# echo "PASS!"
