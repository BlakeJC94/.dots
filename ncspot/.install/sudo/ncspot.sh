#!/bin/bash
apt-get install -y \
    libncursesw5-dev \
    libdbus-1-dev \
    libpulse-dev \
    libssl-dev \
    libxcb1-dev \
    libxcb-render0-dev \
    libxcb-shape0-dev \
    libxcb-xfixes0-dev


if ! [ -x "$(command -v ncspot)" ]; then
    cargo install ncspot
    ln -sf /home/$SUDO_USER/.cargo/bin/ncspot /home/$SUDO_USER/.local/bin/ncspot
fi
