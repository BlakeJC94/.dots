
PACKAGES=( \
    com.slack.Slack \
    com.spotify.Client \
    us.zoom.Zoom \
)
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
for i in "${PACKAGES[@]}"; do
    flatpak install --noninteractive flathub "${i}"
done
