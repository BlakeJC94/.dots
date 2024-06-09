# Link dotfiles
bash link.sh

# brew (interactive sudo)
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew bundle --global install  # update pins w/ `$ brew bundle --global dump -f`

# pacstall
pacstall -IP zoom-deb
pacstall -IP wezterm-deb
pacstall -IP spotify-client-deb

# asdf
source $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh
asdf plugin add python https://github.com/danhper/asdf-python.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add rust https://github.com/code-lever/asdf-rust.git
asdf plugin add julia https://github.com/rkyleg/asdf-julia.git

# font
git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts ~/.nerd-fonts
pushd ~/.nerd-fonts
git sparse-checkout add patched-fonts/JetBrainsMono
bash -c "./install.sh JetBrainsMono"
popd
