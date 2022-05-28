#!/bin/bash
sudo apt install -y lua5.1 npm ripgrep python3-pip python3-tk xclip
sudo python3 -m pip install pynvim

wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar -xzf nvim-linux64.tar.gz --directory=$HOME/.local/opt --wildcards nvim-linux64/*
rm nvim-linux64.tar.gz

if ! [[ "$(command -v nvim)" ]]; then
    sudo ln -sf $HOME/.local/opt/nvim-linux64/bin/nvim $HOME/.local/bin/nvim
    git clone https://github.com/BlakeJC94/nvim.git $HOME/.config/nvim
fi
