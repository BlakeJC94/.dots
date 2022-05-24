#!/bin/bash
wget --progress bar -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
if ! [[ "$(command -v nvm)" ]]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi
nvm install node --latest-npm
