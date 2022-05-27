#!/bin/bash
sudo apt install build-essential procps curl file git

if ! [[ "$(command -v brew)" ]]; then
    # git clone https://github.com/Homebrew/brew $HOME/.homebrew
    # eval "$($HOME/.homebrew/bin/brew shellenv)"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.bash_profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

brew update --force --quiet
# chmod -R go-w "$(brew --prefix)/share/zsh"


