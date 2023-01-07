#!/bin/bash
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar -xzf nvim-linux64.tar.gz --directory=$HOME/.local/opt --wildcards nvim-linux64/*
rm nvim-linux64.tar.gz

if ! [[ "$(command -v nvim)" ]]; then
    ln -sf $HOME/.local/opt/nvim-linux64/bin/nvim $HOME/.local/bin/nvim
fi
