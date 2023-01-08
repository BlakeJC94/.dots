PACKAGES=( \
    com.slack.Slack \
    com.spotify.Client \
    us.zoom.Zoom \
)

for i in "${PACKAGES[@]}"; do
    flatpak install --noninteractive flathub "${i}"
done
