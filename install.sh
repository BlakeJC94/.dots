#!/bin/bash
set -eu -o pipefail # fail on error and report it, debug all lines
sudo -n true
test $? -eq 0 || exit 1 "you should have sudo privilege to run this script"

function red {
    RED='\033[0;31m'
    printf "%s%s%s\n" "$RED" "$@" "$NC"
}

function green {
    GREEN='\033[0;32m'
    printf "%s%s%s\n" "$GREEN" "$@" "$NC"
}

function yellow {
    YELLOW='\033[0;33m'
    printf "%s%s%s\n" "$YELLOW" "$@" "$NC"
}

function get_latest_files_from_github {
    # Args:
    #   $1 : user
    #   $2 : repo
    #   $3 : asset regex
    echo -e "$(yellow "\nDownloading ${3} from Github repo ${1}/${2}\n")"
    curl -s https://api.github.com/repos/"$1"/"$2"/releases/latest \
        | grep browser_download_url \
        | grep $3 \
        | cut -d '"' -f 4 \
        | wget -nv -i -
    return 0
}

# Update apt
echo -e "$(yellow "Updating and upgrading APT packages")"
sudo apt update
sudo apt upgrade -y

# Install packages
echo -e "$(yellow "Installing extra APT packages")"
sudo apt install -y \
    tldr \
    tree \
    bat \
    qt5-style-plugins \
    unclutter-xfixes \
    nvtop \
    bashtop \
    neofetch \
    colorize \
    fortune \
    fzf \
    r-base \
    zathura \
    zathura-djvu \
    zathura-ps \
    slack \
    slack-desktop \
    zoom

# Install Python packages
echo -e "$(yellow "Installing Python APT packages")"
sudo apt install -y \
    python3-pip \
    python3-venv \
    python3-setuptools \
    python3-dev \
    python3-tk \
    ipython3 \
    jupyter

# if not installed, install pyenv
if ! [[ "$(command -v pyenv)" ]]; then
    echo -e "$(yellow "Installing pyenv")"
    curl https://pyenv.run | bash
fi


# if not installed, install NVM
if ! [[ "$(command -v nvm)" ]]; then
    echo -e "$(yellow "Installing NVM and updating Node")"
    wget --progress bar -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm install node --latest-npm
fi

echo -e "$(yellow "Installing NPM packages")"
npm install -g \
    pyright \
    yaml-language-server \
    prettier \
    bash-language-server

# if not installed, install JILL and julia
if ! [[ "$(command -v jill)" ]]; then
    echo -e "$(yellow "Installing JILL")"
    sudo bash -ci "$(curl -fsSL https://raw.githubusercontent.com/abelsiqueira/jill/main/jill.sh)"
fi
sudo jill install stable --confirm

# if not installed, install fonts
if [[ $(find ~/.fonts/ -name 'JetBrains*' | wc -l) -eq 0 ]]; then
    echo -e "$(yellow "Installing JetBrains fonts")"
    mkdir -p ~/.fonts
    get_latest_files_from_github "ryanoasis" "nerd-fonts" "JetBrainsMono.zip"
    unzip JetBrainsMono.zip -d ~/.fonts
    rm JetBrainsMono.zip
fi

# if not installed, install kitty and link config
if ! [[ "$(command -v kitty)" ]]; then
    echo -e "$(yellow "Installing kitty\n")"
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi
ln -sf ~/.dots/.config/kitty ~/.config/kitty

# if not installed, install neovim and clone/link config
if ! [[ "$(command -v nvim)" ]]; then
    echo -e "$(yellow "Installing neovim\n")"
    sudo apt install -y lua5.1 npm ripgrep python3-pip
    sudo python3 -m pip install pynvim
    get_latest_files_from_github "neovim" "neovim" "nvim-linux64.tar.gz"
    sudo tar -xzf nvim-linux64.tar.gz --directory=/opt --wildcards nvim-linux64/*
    rm nvim-linux64.tar.gz
    sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/bin/nvim
    # sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/bin/vim
    sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/bin/nv
    git clone https://github.com/BlakeJC94/nvim.git ~/.config/nvim
fi

# if not installed, install ncspot and link config
if ! [[ "$(command -v ncspot)" ]]; then
    get_latest_files_from_github "hrkfdn" "ncspot" "ncpot-.*-linux.tar.gz"
    tar -xzvf ncspot-v0.8.2-linux.tar.gz --wildcards ncspot --directory=/opt
    sudo ln -s /opt/ncspot /usr/bin/ncspot
fi
ln -sf ~/.dots/.config/ncspot ~/.config/ncspot

# if not installed, install spotify
# echo -e "$(yellow "Installing spotify\n")"
# # Source: https://www.spotify.com/us/download/linux/
# curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
# echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
# sudo apt update && sudo apt install -y spotify-client

# if not installed, install zotero  # TODO replace this
# if ! [[ "$(command -v zotero)" ]]; then
#     echo -e "$(yellow "Installing Zotero\n")"
#     sudo add-apt-repository ppa:smathot/cogscinl
#     sudo apt update
#     sudo apt install -Y zotero-standalone
# fi

# TODO if not installed, install dropbox and prompt to link folders
if ! [[ "$(command -v dropbox)" ]]; then
    echo -e "$(yellow "Installing dropbox\n")"
    sudo apt install python3-gpg
    sudo wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - --directory=~
    sudo curl "https://linux.dropbox.com/packages/dropbox.py" -o "/opt/dropbox.py"
    sudo chmod +x /opt/dropbox.py
    sudo ln -s /opt/dropbox.py /usr/bin/dropbox
fi

# deploy dotfiles
DOTFILES=( .bashrc .bash_prompt .bash_aliases .xinitrc .gitconfig .gitignore .config/zathura)
for i in "${DOTFILES[@]}"; do
    if [ -f "$HOME/$i" ]; then
        mv $HOME/$i $HOME/$i.dotsinstall.bak
    fi
    ln -sf $HOME/.dots/$i $HOME/$i
done

echo -e "$(green "PASS!\n")"
