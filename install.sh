#!/bin/bash
DOTFILES=( \
    .bashrc \
    .bash_prompt \
    .bash_aliases \
    .xinitrc \
    .tmux.conf \
    .gitconfig \
    .gitignore \
    .config/zathura \
    .config/kitty \
    .config/ncspot \
)
SCRIPTS=( \
    ghlatest \
)

mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/opt

echo "=================="
echo "Deploying dotfiles"
for i in "${DOTFILES[@]}"; do
    if [ -f "$HOME/$i" ]; then
        mv $HOME/$i $HOME/$i.dotsinstall.bak
    fi
    ln -sf $HOME/.dots/$i $HOME/$i
done

echo "================="
echo "Deploying scripts"
for i in "${SCRIPTS[@]}"; do
    if [ -f "$HOME/.local/bin/$i" ]; then
        mv $HOME/.local/bin/$i $HOME/.local/bin/.$i.dotsinstall.bak
    fi
    chmod +x $HOME/.local/bin/$i
    ln -sf $HOME/.dots/bin/$i $HOME/.local/bin/$i
done

# Check if sudo was used
if [[ $(id -u) -ne 0 ]] ; then
    echo "Please run as root to update packages." ;
    exit 1
fi

# Use non-interactive sudo and patch `$HOME`
sudo -n true
HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

echo "============"
echo "Updating apt"
source ./scripts/apt.sh

echo "================"
echo "Updating flatpak"
source ./scripts/flatpak.sh

echo "=============="
echo "Updating pyenv"
source ./scripts/pyenv.sh

echo "============"
echo "Updating pip"
source ./scripts/pip.sh

echo "============"
echo "Updating npm"
source ./scripts/npm.sh

echo "============="
echo "Updating brew"
source ./scripts/brew.sh

echo "======================="
echo "Updating work utilities"
source ./update/work.sh

echo "================="
echo "Installing ncspot"
source ./scripts/ncspot.sh

# echo "=============="
# echo "Updating Julia"
# source ./scripts/julia.sh

echo "================"
echo "Installing fonts"
source ./scripts/fonts.sh

echo "================"
echo "Installing kitty"
source ./scripts/kitty.sh

echo "================="
echo "Installing neovim"
source ./scripts/neovim.sh

echo "=================="
echo "Installing dropbox"
source ./scripts/dropbox.sh

echo "====="
echo "PASS!"
