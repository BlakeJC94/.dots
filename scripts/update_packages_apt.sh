#!/bin/bash
sudo apt update
sudo apt upgrade -y

# Install packages
echo "============================="
echo "Installing extra APT packages"
sudo apt install -y \
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
