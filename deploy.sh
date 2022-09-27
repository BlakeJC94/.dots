#!/usr/bin/env bash

mkdir -p ${HOME}/.local/bin ${HOME}/.local/opt

# LINK DOTFILES
# bash $HOME/.dots/scripts/link.sh
source ~/.bashrc

# INSTALL TOOLS THAT NEED SUPERUSER PERMISSION
sudo bash ${HOME}/.dots/scripts/packages_global.sh

# INSTALL TOOLS THAT DON'T NEED SUPERUSER PERMISSION
bash ${HOME}/.dots/scripts/packages_local.sh

# update tldr
tldr -u

echo "==> PASS!"
