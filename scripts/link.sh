#!/usr/bin/env bash


DOTS="${HOME}"/.dots
BACKUP_BASHRC="${HOME}"/.bashrc.bak


if ! [ -x "$(command -v stow)" ]; then
    printf '%s\n' 'GNU stow not found, requesting permission to install'
    sudo bash -c "apt install stow"
fi

source "${DOTS}"/scripts/get_dirs.sh
readarray -d '' dirs_to_stow < <(get_dirs)

# backup .bashrc if needed
bashrc="${HOME}"/.bashrc
if ! [ -L "${bashrc}" ]; then
    printf '%s\n' "Backing up ${bashrc} (moved to ${BACKUP_BASHRC})"
    mv "${bashrc}" "${BACKUP_BASHRC}"
fi

for dir in ${dirs_to_stow[@]}; do
    name=$(basename $dir)
    printf '%s  [%s]\n' "${dir}" "$name"
    stow -D "${name}"
    stow "${name}"
done
