#!/usr/bin/env bash
#

DOTS="${HOME}"/.dots

# link dotfiles
bash "${DOTS}"/scripts/link.sh

# apt update and install
sudo bash "${DOTS}"/scripts/apt.sh

# flatpak install
bash "${DOTS}"/scripts/flatpak.sh

# run sudo installs
# run installs
