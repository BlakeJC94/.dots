#!/usr/bin/env bash

DOTS="${HOME}"/.dots


bash "${DOTS}"/.scripts/link.sh

sudo bash "${DOTS}"/.scripts/sudo/apt.sh
# sudo bash "${DOTS}"/.scripts/sudo/pyenv.sh
bash "${DOTS}"/.scripts/asdf.sh
bash "${DOTS}"/.scripts/flatpak.sh

# sudo bash "${DOTS}"/.scripts/sudo/install_scripts.sh
# bash "${DOTS}"/.scripts/install_scripts.sh
