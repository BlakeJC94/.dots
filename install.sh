#!/bin/bash

# TODO write an installer for better-bibtex

TMP=tmp

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
    mkdir -p $TMP
    cd $TMP

    echo -e "$(yellow "\nDownloading ${3} from Github repo ${1}/${2}\n")"
    curl -s https://api.github.com/repos/"$1"/"$2"/releases/latest \
        | grep browser_download_url \
        | grep $3 \
        | cut -d '"' -f 4 \
        | wget -nv -i -
    cd ..
    return 0
}

install_packages() {
    echo -e "$(yellow "\nInstalling Packages\n")"

    install_python_stuff() {
        echo -e "$(yellow "Installing python stuff")"

        install_pyenv() {
            echo -e "$(yellow "\nFinished installing pyenv\n")"
            curl https://pyenv.run | bash
            echo -e "$(green "\nFinished installing pyenv\n")"
        }

        sudo apt install -y \
            python3-pip \
            python3-venv \
            python3-setuptools \
            python3-dev \
            ipython3 \
            jupyter

        install_pyenv
        echo -e "$(green "Finished installing python stuff")"
    }
    install_npm_stuff() {
        echo -e "$(yellow "Installing npm stuff")"


        install_nvm() {
            echo -e "$(yellow "Installing nvm")"
            if wget --progress bar -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash; then
                echo -e "$(green "Successfully installed nvm")"
            else
                echo -e "$(red "Error installing nvm. Exiting...")"; exit 1
            fi
        }
        install_node() {
            echo -e "$(yellow "Beginning node setup")"

            export NVM_DIR="$HOME/.nvm"
            [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
            [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
            nvm install node --latest-npm

            echo -e "$(green "Finished node setup")"
        }

        install_nvm
        install_node

        if npm install -g pyright \
            yaml-language-server \
            prettier \
            bash-language-server; then
                echo -e "$(green "Finished npm packages")"
            else
                echo -e "$(red "Failed to install npm packages")"; exit 1
        fi
    }
    install_julia_stuff() {
        echo -e "$(yellow "Installing julia stuff")"
        sudo bash -ci "$(curl -fsSL https://raw.githubusercontent.com/abelsiqueira/jill/main/jill.sh)"
        echo -e "$(green "Finished installing julia stuff")"
    }

    echo -e "$(yellow "\nUpdating Package Repository\n")"
    sudo apt update

    echo -e "$(yellow "\nAttempting to upgrade packages\n")"
    sudo apt upgrade -y

    echo -e "$(yellow "\nInstalling extra distro packages\n")"
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
        r-base

    echo -e "$(yellow "\nInstalling extra python packages\n")"
    install_python_stuff

    echo -e "$(yellow "\nInstalling extra node packages\n")"
    install_npm_stuff

    echo -e "$(yellow "\nInstalling extra julia packages\n")"
    install_npm_stuff

    echo -e "$(green "\nFinished installing packages\n")"
}


install_fonts() {
    echo -e "$(yellow "\nInstalling fonts\n")"

    mkdir -p $HOME/.fonts
    get_latest_files_from_github "ryanoasis" "nerd-fonts" "JetBrainsMono.zip"
    cd $TMP

    unzip JetBrainsMono.zip
    mv * $HOME/.fonts

    cd ..
    rm -r $TMP
    echo -e "$(green "\nFinished installing fonts\n")"
}

install_apps() {
    install_kitty() {
        echo -e "$(yellow "\nInstalling kitty\n")"
        curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
        echo -e "$(green "\nFinished installing kitty\n")"
    }

    install_lazygit() {
        echo -e "$(yellow "\nInstalling lazygit\n")"

        get_latest_files_from_github "jesseduffield" "lazygit" "lazygit_.*_Linux_x84_64.tar.gz"
        cd $TMP

        tar xzvf lazygit_*_Linux_x84_64.tar.gz
        sudo mv lazygit /opt
        sudo ln -sf /opt/lazygit /usr/bin/lazygit

        cd ..
        rm -r $TMP
        echo -e "$(green "\nFinished installing lazygit\n")"
    }

    install_neovim() {
        echo -e "$(yellow "\nInstalling neovim\n")"

        sudo apt install -y lua5.1 npm ripgrep python3-pip
        sudo python3 -m pip install pynvim

        get_latest_files_from_github "neovim" "neovim" "nvim-linux64.tar.gz"
        cd $TMP

        tar -xzf nvim-linux64.tar.gz
        sudo mv nvim-linux64 /opt
        sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/bin/nvim
        sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/bin/vim
        sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/bin/nv

        cd ..
        rm -r $TMP
    }

    install_ncspot() {
        echo -e "$(yellow "\nInstalling ncspot\n")"

        get_latest_files_from_github "hrkfdn" "ncspot" "ncpot-.*-linux.tar.gz"
        cd $TMP

        tar -xzvf ncspot-v0.8.2-linux.tar.gz
        sudo mv ncspot /opt/
        sudo ln -s /opt/ncspot /usr/bin/ncspot

        cd ..
        rm -r $TMP
        echo -e "$(green "\nFinished installing ncspot\n")"
    }

    install_spotify() {
        echo -e "$(yellow "\nInstalling spotify\n")"
        # Source: https://www.spotify.com/us/download/linux/
        curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
        echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
        sudo apt update && sudo apt install -y spotify-client
        echo -e "$(green "\nFinished installing spotify\n")"
    }

    install_zathura() {
        echo -e "$(yellow "\nInstalling zathura\n")"
        sudo apt install -y zathura zathura-djvu zathura-ps
        echo -e "$(green "\nFinished installing zathura\n")"
    }

    install_slack() {
        echo -e "$(yellow "\nInstalling slack\n")"
        sudo apt install -y slack slack-desktop
        echo -e "$(green "\nFinished installing slack\n")"
    }

    install_zoom() {
        echo -e "$(yellow "\nInstalling zoom\n")"
        sudo apt install -y zoom
        echo -e "$(green "\nFinished installing zoom\n")"
    }

    install_zotero() {
        echo -e "$(yellow "\nInstalling zotero\n")"
        sudo add-apt-repository ppa:smathot/cogscinl
        sudo apt-get update
        sudo apt-get install zotero-standalone
        echo -e "$(green "\nFinished installing zotero\n")"
    }


    install_kitty
    install_lazygit
    install_neovim
    install_ncspot
    install_spotify
    install_zathura
    install_slack
    install_zoom

}

install_dropbox(){
    echo -e "$(yellow "\nInstalling dropbox\n")"
    sudo apt install python3-gpg

    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    cd ~ && curl "https://linux.dropbox.com/packages/dropbox.py" -o "/tmp/dropbox.py"

    sudo mv /tmp/dropbox.py /opt/
    sudo chmod +x /opt/dropbox.py
    sudo ln -s /opt/dropbox.py /usr/bin/dropbox

    echo -e "$(green "\nFinished installing dropbox\n")"
}

deploy_dots(){
    echo -e "$(yellow "\nDeploying dotfiles\n")"

    DOTFILES=( .bashrc .bash_prompt .bash_aliases .xinitrc .gitconfig .gitignore )
    for i in "${DOTFILES[@]}"; do
        if [ -f "$HOME/$i" ]; then
            mv $HOME/$i $HOME/$i.dotsinstall.bak
        fi
        ln -sf $HOME/.dots/$i $HOME/$i
    done

    for DIR in $(find ./.config -mindepth 1 -maxdepth 1 -type d | sed 's/\.\/\.config\///'); do
        DEST=$HOME/.dots/.config/$DIR
        TARGET=$HOME/.config/$DIR
        ln -sf $DEST $TARGET
    done
    echo -e "$(green "\nFinished deploying dotfiles\n")"
}


# EXECUTION
# set -eu -o pipefail # fail on error and report it, debug all lines
# sudo -n true
# test $? -eq 0 || exit 1 "you should have sudo privilege to run this script"
# install_packages
# install_fonts
# install_apps
# install_dropbox
# deploy_dots





