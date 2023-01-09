wget -qO - https://regolith-desktop.org/regolith.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null

echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://regolith-desktop.org/release-ubuntu-kinetic-amd64 kinetic main" | \
sudo tee /etc/apt/sources.list.d/regolith.list

apt-get update
apt-get install -y regolith-desktop regolith-compositor-picom-glx
apt-get install -y i3xrocks-focused-window-name i3xrocks-rofication i3xrocks-info i3xrocks-app-launcher i3xrocks-memory
apt-get install -y i3xrocks-battery
apt-get upgrade -y

