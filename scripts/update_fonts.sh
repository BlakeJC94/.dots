#!/bin/bash
if [[ $(find ~/.fonts/ -name 'JetBrains*' | wc -l) -eq 0 ]]; then
    mkdir -p $HOME/.fonts
    get_latest_files_from_github "ryanoasis" "nerd-fonts" "JetBrainsMono.zip"
    unzip JetBrainsMono.zip -d $HOME/.fonts
    rm JetBrainsMono.zip
fi

