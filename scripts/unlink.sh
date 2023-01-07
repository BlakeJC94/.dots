#!/usr/bin/env bash
DOTS="${HOME}"/.dots

dirs_to_stow=$( \
    find "${DOTS}" \
        -maxdepth 1 -mindepth 1 \
        -type d \
        -not -regex '.*\(scripts\|extras\|\.git\|\.archived\)' \
        -print0
)

for dir in ${dirs_to_stow}; do
    stow -D "${dir}"
done
