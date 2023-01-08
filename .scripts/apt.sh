apt-get update
apt-get install -y \
    flatpak \
    tmux \
    jq \
    tree \
    bat \
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
    cargo \
    tldr

# Configure flatpak if needed
flatpak_xdg=/var/lib/flatpak/exports/share
if ! [[ "$XDG_DATA_DIRS" =~ (^|:)"${flatpak_xdg}"(:|$) ]]
then
    XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"
fi

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
