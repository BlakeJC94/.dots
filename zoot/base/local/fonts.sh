#!/bin/bash
if [[ $(find ~/.fonts/ -name 'JetBrains*' | wc -l) -eq 0 ]]; then
    mkdir -p $HOME/.fonts
    wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
    unzip JetBrainsMono.zip -d $HOME/.fonts
    rm JetBrainsMono.zip
fi

