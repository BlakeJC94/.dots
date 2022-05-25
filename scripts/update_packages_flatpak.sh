#!/bin/bash
PACKAGES=( \
    com.slack.Slack \
    com.spotify.Client \
    us.zoom.Zoom \
)
sudo apt install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

for i in "${PACKAGES[@]}"; do
    flatpak install --noninteractive flathub $i
done

