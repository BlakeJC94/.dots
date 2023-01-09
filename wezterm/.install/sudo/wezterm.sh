VERSION=$( \
    curl -s https://api.github.com/repos/wez/wezterm/releases/latest \
    | grep tag_name \
    | cut -d '"' -f 4 \
)
if ! [ -x "$(command -v wezterm)" ] || [ "$(wezterm --version | cut -d ' ' -f 2)" != "${VERSION}" ]; then
    wget \
        https://github.com/wez/wezterm/releases/download/${VERSION}/wezterm-${VERSION}.Ubuntu22.04.deb \
        -O /tmp/wezterm.deb
    apt install -y /tmp/wezterm.deb
    rm /tmp/wezterm.deb
    update-alternatives --set x-terminal-emulator /usr/bin/open-wezterm-here
fi
