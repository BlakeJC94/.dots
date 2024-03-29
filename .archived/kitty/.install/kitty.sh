#!/bin/bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
    launch=n dest=$HOME/.local/opt
if ! [[ "$(command -v kitty)" ]]; then
    ln -sf $HOME/.local/kitty.app/bin/kitty $HOME/.local/bin/kitty
    # update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $HOME/.local/bin/kitty 50
    ln -sf $HOME/.local/opt/kitty.app/share/applications/kitty.desktop $HOME/.local/share/applications/kitty.desktop
fi

