#!/usr/bin/env bash

DOTS="${HOME}"/.dots


run_scripts(){
    shopt -s globstar
    root_dir="${1}"
    for f in "${root_dir}"/*.sh; do
        bash "${f}" 2>&1 > "${f}".log
    done
}

# bash "${DOTS}"/scripts/link.sh

# sudo bash "${DOTS}"/scripts/apt.sh
# bash "${DOTS}"/scripts/flatpak.sh

# run sudo installs and user installs
# sudo bash -c "$(declare -f run_scripts); run_scripts ${HOME}/.install-global"
# bash -c "$(declare -f run_scripts); run_scripts ${HOME}/.install"
