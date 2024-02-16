# TODO Check for sudo
# TODO deb-get

sudo apt-get update

# General tools
sudo apt-get install -y \
    flatpak \
    vim-gtk \
    wget \
    curl \
    git \
    tree \
    nvtop \
    bashtop \
    unzip \
    tldr \
    zathura \
    fortune \
    stow \
    xclip \
    unclutter-xfixes

# flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Python deps
sudo apt-get install -y \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev  \
    libreadline-dev \
    libsqlite3-dev curl \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev

# LuaJIT deps
# sudo apt-get install -y \
#     linux-headers-$(uname -r) \
#     build-essential \
#     libreadline-dev


# Zoom dependecies
sudo apt install libxcb-xinerama0 libxcb-xtest0 libxcb-cursor0

# Brew deps
sudo apt-get install -y \
    build-essential \
    procps \
    curl \
    file \
    git

