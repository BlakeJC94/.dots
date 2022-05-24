#!/bin/bash
echo "=================="
echo "Deploying dotfiles"
bash ./scripts/deploy_dotfiles.sh

echo "====================="
echo "Updating APT packages"
bash ./scripts/update_packages_apt.sh

echo "==============="
echo "Updating python"
bash ./scripts/update_python.sh

echo "============"
echo "Updating nvm"
bash ./scripts/update_nvm.sh

echo "====================="
echo "Updating NPM packages"
bash ./scripts/update_packages_npm.sh

# echo "================"
# echo "Installing Julia"
# bash ./scripts/update_julia.sh

echo "================"
echo "Installing fonts"
bash ./scripts/update_fonts.sh

echo "================"
echo "Installing kitty"
bash ./scripts/update_kitty.sh

echo "================="
echo "Installing neovim"
bash ./scripts/update_neovim.sh

echo "================="
echo "Installing ncspot"
bash ./scripts/update_ncspot.sh

echo "===================="
echo "Installing tailscale"
bash ./scripts/update_tailscale.sh

echo "=================="
echo "Installing dropbox"
bash ./scripts/update_dropbox.sh

echo "====="
echo "PASS!"
