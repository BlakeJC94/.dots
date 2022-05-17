#!/bin/bash

function get_latest_files_from_github {
    # Args:
    #   $1 : user
    #   $2 : repo
    #   $3 : asset regex
    echo -e "\nDownloading ${3} from Github repo ${1}/${2}\n"
    curl -s https://api.github.com/repos/"$1"/"$2"/releases/latest \
        | grep browser_download_url \
        | grep $3 \
        | cut -d '"' -f 4 \
        | wget -nv -i -
    return 0
}


# deploy dotfiles
echo "=================="
echo "Deploying dotfiles"
mkdir -p $HOME/.local/bin
DOTFILES=( .bashrc .bash_prompt .bash_aliases .xinitrc .gitconfig .gitignore .config/zathura .config/kitty .config/ncspot )
for i in "${DOTFILES[@]}"; do
    if [ -f "$HOME/$i" ]; then
        mv $HOME/$i $HOME/$i.dotsinstall.bak
    fi
    ln -sf $HOME/.dots/$i $HOME/$i
done

# Update apt
echo "==================================="
echo "Updating and upgrading APT packages"
#sudo apt update
#sudo apt upgrade -y

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
    fzf

echo "==============================="
echo "Installing monitor APT packages"
sudo apt install -y \
    nvtop \
    bashtop \
    neofetch 


echo "==============================="
echo "Installing Zathura APT packages"
sudo apt install -y \    
    zathura \
    zathura-djvu \
    zathura-ps

# Install Python packages
echo "=============================="
echo "Installing Python APT packages"
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
    echo "================"
    echo "Installing pyenv"
    curl https://pyenv.run | bash
fi


# if not installed, install NVM
if ! [[ "$(command -v nvm)" ]]; then
    echo "================================"
    echo "Installing NVM and updating Node"
    wget --progress bar -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm install node --latest-npm
fi

echo "======================="
echo "Installing NPM packages"
npm install -g \
    pyright \
    yaml-language-server \
    prettier \
    bash-language-server

# if not installed, install JILL and julia
#if ! [[ "$(command -v jill)" ]]; then
#    echo "==============="
#    echo "Installing JILL"
#    sudo bash -ci "$(curl -fsSL https://raw.githubusercontent.com/abelsiqueira/jill/main/jill.sh)"
#fi
#sudo jill install stable --confirm

# if not installed, install fonts
if [[ $(find ~/.fonts/ -name 'JetBrains*' | wc -l) -eq 0 ]]; then
    echo "=========================="
    echo "Installing JetBrains fonts"
    mkdir -p $HOME/.fonts
    get_latest_files_from_github "ryanoasis" "nerd-fonts" "JetBrainsMono.zip"
    unzip JetBrainsMono.zip -d $HOME/.fonts
    rm JetBrainsMono.zip
fi

# if not installed, install kitty and link config
if ! [[ "$(command -v kitty)" ]]; then
    echo "================"
    echo "Installing kitty"
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

# if not installed, install neovim and clone/link config
if ! [[ "$(command -v nvim)" ]]; then
    echo "Installing neovim"
    sudo apt install -y lua5.1 npm ripgrep python3-pip xclip
    sudo python3 -m pip install pynvim
    get_latest_files_from_github "neovim" "neovim" "nvim-linux64.tar.gz"
    sudo tar -xzf nvim-linux64.tar.gz --directory=$HOME/.local --wildcards nvim-linux64/*
    rm nvim-linux64.tar.gz*
    sudo ln -sf $HOME/.local/nvim-linux64/bin/nvim $HOME/.local/bin/nvim
    sudo ln -sf $HOME/.local/bin/nvim $HOME/.local/bin/nv
    sudo ln -sf $HOME/.local/bin/nvim $HOME/.local/bin/vim
    git clone https://github.com/BlakeJC94/nvim.git $HOME/.config/nvim
fi

# if not installed, install ncspot and link config
if ! [[ "$(command -v ncspot)" ]]; then
    get_latest_files_from_github "hrkfdn" "ncspot" "ncspot-.*-linux-x86_64.tar.gz"
    for filename in ./ncspot*.tar.gz; do tar -xzvf $filename --directory=$HOME/.local; done
    sudo ln -s $HOME/.local/ncspot $HOME/.local/bin/ncspot
fi

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
if ! [[ "$(command -v dropbox)" ]]
then
    echo "Installing dropbox"
    sudo apt install python3-gpg
    sudo wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - --directory=~
    sudo curl "https://linux.dropbox.com/packages/dropbox.py" -o "$HOME/.local/dropbox.py"
    sudo chmod +x $HOME/.local/dropbox.py
    sudo ln -s $HOME/.local/dropbox.py $HOME/.local/bin/dropbox
fi



echo "PASS!"
