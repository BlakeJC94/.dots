#!/usr/bin/env bash

if ! [ -x "$(command -v asdf)" ]; then
    exit
fi

asdf plugin-add rust
asdf plugin-add python
asdf plugin-add poetry
asdf plugin-add nodejs
asdf plugin-add julia

