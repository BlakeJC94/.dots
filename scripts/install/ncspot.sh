#!/bin/bash
sudo apt install \
    cargo \
    libncursesw5-dev \
    libdbus-1-dev \
    libpulse-dev \
    libssl-dev \
    libxcb1-dev \
    libxcb-render0-dev \
    libxcb-shape0-dev \
    libxcb-xfixes0-dev

if ! [[ "$(command -v ncspot)" ]]; then
    cargo install ncspot
    sudo ln -s $HOME/.cargo/bin/ncspot $HOME/.local/bin/ncspot
fi

