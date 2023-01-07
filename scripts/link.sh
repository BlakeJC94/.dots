#!/usr/bin/env bash

DOTS="${HOME}"/.dots
source "${DOTS}"/scripts/get_dirs.sh

if ! [ -x "$(command -v stow)" ]; then
    printf '%s\n' 'GNU stow not found, requesting permission to install'
    sudo bash -c "apt install stow"
fi

readarray -d '' dirs_to_stow < <(get_dirs)


for dir in ${dirs_to_stow[@]}; do
    name=$(basename $dir)
    printf '%s  [%s]\n' "${dir}" "$name"
    stow -D "${name}"
    stow "${name}"
done
