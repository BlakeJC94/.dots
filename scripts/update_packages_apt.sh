#!/bin/bash
sudo apt update
sudo apt upgrade -y

# Install packages
sudo apt install -y \
    tmux \
    tldr \
    tree \
    bat \
    qt5-style-plugins \
    unclutter-xfixes \
    colorize \
    fortune \
    fzf \
    nvtop \
    bashtop \
    neofetch \
    zathura \
    zathura-djvu \
    zathura-ps

tldr update
