# Check if sudo was used
if [[ $(id -u) -ne 0 ]] ; then
    echo "Please run as root to update APT packages." ;
    exit 1
fi
# Use non-interactive sudo and patch `$HOME`
# sudo -n true
# HOME=$(getent passwd $SUDO_USER | cut -d: -f6)


# ADD SOURCE FOR REGOLITH
# Register the Regolith public key to your local apt
wget -qO - https://regolith-desktop.org/regolith.key | gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null
# Add the repository URL to your local apt
echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] https://regolith-desktop.org/release-ubuntu-jammy-amd64 jammy main" | \
tee /etc/apt/sources.list.d/regolith.list


# UPDATE AND UPGRADE APT
apt update
apt upgrade -y


# INSTALL REGOLITH
apt install -y \
    regolith-desktop \
    regolith-look-gruvbox \
    i3xrocks-focused-window-name \
    i3xrocks-rofication \
    i3xrocks-info \
    i3xrocks-app-launcher \
    i3xrocks-memory \
    i3xrocks-battery \
    regolith-compositor-picom-glx \
    playerctl \


# INSTALL COMMAND LINE TOOLS
apt install -y \
    tmux \
    jq \
    tldr \
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
    ripgrep



# INSTALL OTHER PACKAGE MANAGERS AND DEPENDENCIES
apt install -y \
    luarocks \
    lua5.1 \
    cargo \
    cmake

# INSTALL BREW DEPENDENCIES
apt install -y \
    build-essential \
    procps \
    curl \
    file \
    git

# INSTALL NCSPOT DEPENDENCIES
apt install -y \
    libncursesw5-dev \
    libdbus-1-dev \
    libpulse-dev \
    libssl-dev \
    libxcb1-dev \
    libxcb-render0-dev \
    libxcb-shape0-dev \
    libxcb-xfixes0-dev


# INSTALL ZATHURA
apt install -y \
    zathura \
    zathura-djvu \
    zathura-ps


# INSTALL PYTHON BUILD DEPENDENCIES
apt install -y \
    build-essential \
    gdb \
    lcov \
    pkg-config \
    libbz2-dev \
    libffi-dev \
    libgdbm-dev \
    libgdbm-compat-dev \
    liblzma-dev \
    libncurses5-dev \
    libreadline6-dev \
    libsqlite3-dev libssl-dev \
    lzma \
    lzma-dev \
    tk-dev \
    uuid-dev \
    zlib1g-dev


# DOWNLOAD SOURCE FOR WEZTERM AND INSTALL
VERSION=$(curl -s https://api.github.com/repos/wez/wezterm/releases/latest|grep tag_name|cut -d '"' -f 4)
if ! [ "$(command -v wezterm)" ] || [ "$(wezterm --version | cut -d ' ' -f 2)" != "${VERSION}" ]; then
    wget \
        https://github.com/wez/wezterm/releases/download/${VERSION}/wezterm-${VERSION}.Ubuntu22.04.deb \
        -o /tmp/wezterm.deb
    apt install -y /tmp/wezterm.deb
    rm /tmp/wezterm.deb
    update-alternatives --set x-terminal-emulator /usr/bin/open-wezterm-here
fi


# INSTALL AND CONFIGURE FLATPAK
PACKAGES=( \
    com.slack.Slack \
    com.spotify.Client \
    us.zoom.Zoom \
)
apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
for i in "${PACKAGES[@]}"; do
    flatpak install --noninteractive flathub "${i}"
done

