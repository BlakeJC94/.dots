# flatpak
flatpak install flathub org.wezfurlong.wezterm
flatpak install flathub com.slack.Slack
flatpak install flathub us.zoom.Zoom
flatpak install flathub io.mpv.Mpv

# brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew bundle --global install  # update pins w/ `$ brew bundle --global dump -f`

# asdf
source $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh
asdf plugin add python https://github.com/danhper/asdf-python.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add rust https://github.com/code-lever/asdf-rust.git
asdf plugin add julia https://github.com/rkyleg/asdf-julia.git
asdf plugin add luajit https://github.com/smashedtoatoms/asdf-luaJIT.git

# font
git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts ~/.nerd-fonts
pushd .nerd-fonts
git sparse-checkout add patched-fonts/JetBrainsMono
bash -c "./install.sh JetBrainsMono"
popd

# key
[ -f ~/.ssh/id_ed25519.pub ] || ssh-keygen -t ed25519 -C "blakejamescook@gmail.com"
cat ~/.ssh/id_ed25519.pub | xclip -selection c
echo "--------"
echo "PASTE PUBKEY FROM CLIPBOARD TO:"
echo "https://github.com/settings/ssh/new"
echo "--------"
