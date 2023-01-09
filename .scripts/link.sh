#!/usr/bin/env bash


DOTS="${HOME}"/.dots
BACKUP_BASHRC="${HOME}"/.bashrc.bak

mkdir -p "${HOME}"/.local/bin
mkdir -p "${HOME}"/.local/opt
mkdir -p "${HOME}"/.install/sudo

if ! [ -x "$(command -v stow)" ]; then
    printf '%s\n' 'GNU stow not found, requesting permission to install'
    sudo bash -c "apt install stow"
fi


# backup .bashrc if needed
bashrc="${HOME}"/.bashrc
if ! [ -L "${bashrc}" ]; then
    printf '%s\n' "Backing up ${bashrc} (moved to ${BACKUP_BASHRC})"
    mv "${bashrc}" "${BACKUP_BASHRC}"
fi

shopt -s globstar
pushd "${DOTS}"
for dir in ./*/; do
    name=$(basename $dir)
    printf '%s  [%s]\n' "${dir}" "$name"
    stow -D "${name}"
    stow "${name}"
done
popd
