if ! [ -x "$(command -v nvm)" ]; then
    export PROFILE=/dev/null
    wget --progress bar -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    export -n PROFILE
fi
nvm install node --latest-npm
