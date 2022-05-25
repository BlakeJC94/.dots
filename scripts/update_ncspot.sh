#!/bin/bash
source $HOME/.dots/scripts/github_files.sh

get_latest_files_from_github "hrkfdn" "ncspot" "ncspot-.*-linux-x86_64.tar.gz"
for filename in ./ncspot*.tar.gz; do tar -xzvf $filename --directory=$HOME/.local; done

if ! [[ "$(command -v ncspot)" ]]; then
    sudo ln -s $HOME/.local/ncspot $HOME/.local/bin/ncspot
fi
