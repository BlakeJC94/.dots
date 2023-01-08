#!/usr/bin/env bash

DOTS="${HOME}"/.dots
BACKUP_BASHRC="${HOME}"/.bashrc.bak

source "${DOTS}"/scripts/get_dirs.sh
readarray -d '' dirs_to_stow < <(get_dirs)

for dir in ${dirs_to_stow[@]}; do
    name=$(basename $dir)
    printf '%s  [%s]\n' "${dir}" "$name"
    stow -D "${name}"
done

# restore backup bashrc if needed
bashrc="${HOME}"/.bashrc
if ! [ -f "${bashrc}" ]; then
    printf '%s\n' "Restoring backup ${BACKUP_BASHRC} to ${bashrc}"
    mv "${BACKUP_BASHRC}" "${bashrc}"
fi
