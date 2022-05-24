#!/bin/bash
if ! [[ "$(command -v pyenv)" ]]; then
    echo "===================================="
    echo "Installing Python build dependencies"
    sudo apt install -y \
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

    echo "=============================="
    echo "Installing Python APT packages"
    sudo apt install -y \
        python3-pip \
        python3-venv \
        python3-setuptools \
        python3-dev \
        python3-tk \
        ipython3 \
        jupyter

    echo "================"
    echo "Installing pyenv"
    curl https://pyenv.run | bash
else
    pyenv update
fi

