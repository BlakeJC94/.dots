#!/bin/bash
if ! [[ "$(command -v jill)" ]]; then
    sudo bash -ci "$(curl -fsSL https://raw.githubusercontent.com/abelsiqueira/jill/main/jill.sh)"
fi
sudo jill install stable --confirm

