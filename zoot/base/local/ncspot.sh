#!/bin/bash
if ! [[ "$(command -v ncspot)" ]]; then
    cargo install ncspot
    sudo ln -s $HOME/.cargo/bin/ncspot $HOME/.local/bin/ncspot
fi

