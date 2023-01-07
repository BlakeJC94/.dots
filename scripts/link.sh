#!/usr/bin/env bash

if ! [ -x "$(command -v stow)" ]; then
    printf '%s\n' 'GNU stow not found, requesting permission to install'
    sudo bash -c "apt install stow"
fi

# Get list of top level directories
DIRS_TO_SET_UP=$( \
    find "${DOTS}" \
        -maxdepth 1 -mindepth 1 \
        -type d \
        -not -regex '.*\(scripts\|extras\|\.git\|\.archived\)' \
        -print0
)

for dir in ${DIRS_TO_SET_UP}; do
    stow -D "${dir}"
    stow "${dir}"
done

echo "==> Done!"
