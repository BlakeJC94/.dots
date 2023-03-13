apt-get update
apt-get install -y \
    git \
    git-extras \
    curl \
    direnv \
    flatpak \
    tmux \
    jq \
    tree \
    bat \
    fd-find \
    colorize \
    fortune \
    fzf \
    nvtop \
    bashtop \
    neofetch \
    qt5-style-plugins \
    unclutter-xfixes \
    xclip \
    ripgrep \
    luarocks \
    lua5.1 \
    cmake \
    tldr \
    g++


if [ -x "$(command -v snap)" ]; then
    snap remove firefox
    apt-get remove snapd
    flatpak install --noninteractive flathub org.mozilla.firefox
fi

