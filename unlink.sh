#!/usr/bin/env bash

DOTS="${HOME}"/.dots
BACKUP_BASHRC="${HOME}"/.bashrc.bak

shopt -s globstar
pushd "${DOTS}"
for dir in ./*/; do
    name=$(basename $dir)
    printf '%s  [%s]\n' "${dir}" "$name"
    stow -D "${name}"
done
popd

# restore backup bashrc if needed
bashrc="${HOME}"/.bashrc
if ! [ -f "${bashrc}" ] && [ -f ${BACKUP_BASHRC} ]; then
    printf '%s\n' "Restoring backup ${BACKUP_BASHRC} to ${bashrc}"
    mv "${BACKUP_BASHRC}" "${bashrc}"
fi
