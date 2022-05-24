#!/bin/bash
source ./github_files.sh

sudo apt install -y lua5.1 npm ripgrep python3-pip xclip
sudo python3 -m pip install pynvim

get_latest_files_from_github "neovim" "neovim" "nvim-linux64.tar.gz"
sudo tar -xzf nvim-linux64.tar.gz --directory=$HOME/.local --wildcards nvim-linux64/*
rm nvim-linux64.tar.gz*

if ! [[ "$(command -v nvim)" ]]; then
    sudo ln -sf $HOME/.local/nvim-linux64/bin/nvim $HOME/.local/bin/nvim
    git clone https://github.com/BlakeJC94/nvim.git $HOME/.config/nvim
fi
