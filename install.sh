#!/bin/bash
echo "=================="
echo "Deploying dotfiles"
source ./scripts/deploy_dotfiles.sh

echo "====================="
echo "Updating APT packages"
source ./scripts/update_packages_apt.sh

echo "==============="
echo "Updating python"
source ./scripts/update_python.sh

echo "====================="
echo "Updating pip packages"
source ./scripts/update_packages_pip.sh

echo "============"
echo "Updating nvm"
source ./scripts/update_nvm.sh

echo "====================="
echo "Updating npm packages"
source ./scripts/update_packages_npm.sh

echo "=============="
echo "Updating brew"
source ./scripts/update_brew.sh

echo "======================"
echo "Updating brew packages"
source ./scripts/update_packages_brew.sh

echo "========================="
echo "Updating flatpak packages"
source ./scripts/update_packages_flatpak.sh

# echo "=============="
# echo "Updating Julia"
# source ./scripts/update_julia.sh

echo "================"
echo "Installing fonts"
source ./scripts/update_fonts.sh

# echo "================"
# echo "Installing kitty"
# source ./scripts/update_kitty.sh

echo "================="
echo "Installing neovim"
source ./scripts/update_neovim.sh

echo "================="
echo "Installing ncspot"
source ./scripts/update_ncspot.sh

echo "===================="
echo "Installing tailscale"
source ./scripts/update_tailscale.sh

echo "=================="
echo "Installing dropbox"
source ./scripts/update_dropbox.sh

echo "====="
echo "PASS!"
