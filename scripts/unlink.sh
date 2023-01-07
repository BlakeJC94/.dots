#!/usr/bin/env bash
DOTS="${HOME}"/.dots

source "${DOTS}"/scripts/get_dirs.sh
# get_dirs() { find "${DOTS}" \
#         -maxdepth 1 -mindepth 1 \
#         -type d \
#         -not -regex '.*\(scripts\|extras\|\.git\|\.archived\)' \
#         -print0 
# }

readarray -d '' dirs_to_stow < <(get_dirs)

for dir in ${dirs_to_stow[@]}; do
    name=$(basename $dir)
    printf '%s  [%s]\n' "${dir}" "$name"
    stow -D "${name}"
done
