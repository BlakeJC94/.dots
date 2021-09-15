mkdir -p $HOME/.local/share/keyrings

unlink $HOME/.local/share/keyrings/spotify.keyring
ln -s $HOME/Workspace/.keys/.spotify $HOME/.local/share/keyrings/spotify.keyring

unlink $HOME/.local/share/keyrings/slack.keyring
ln -s $HOME/Workspace/.keys/.slack $HOME/.local/share/keyrings/slack.keyring
