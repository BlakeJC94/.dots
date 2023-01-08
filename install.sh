#!/usr/bin/env bash

DOTS="${HOME}"/.dots

source "${DOTS}"/scripts/run_scripts.sh
source "${DOTS}"/scripts/get_scripts.sh

# bash "${DOTS}"/scripts/link.sh
# sudo bash "${DOTS}"/scripts/apt.sh

# run sudo installs
readarray -d '' arr < <(get_scripts "${HOME}/.install-global")
sudo bash -c "$(declare -f run_scripts); run_scripts \$@" -- "${arr[@]}"

# run installs
readarray -d '' arr < <(get_scripts "${HOME}/.install")
bash -c "$(declare -f run_scripts); run_scripts \$@" -- "${arr[@]}"


# flatpak install
# bash "${DOTS}"/scripts/flatpak.sh
