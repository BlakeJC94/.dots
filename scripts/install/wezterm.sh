# source $HOME/.dots/scripts/utils/get_latest_files_from_github.sh
# mkdir -pf ~/.local/opt/wezterm
# get_latest_files_from_github wez wezterm AppImage
# for i in *AppImage; do
#     chmod a+x ${i}
#     mv ${i} ~/.local/opt/wezterm
#     ln -sf ~/.local/opt/wezterm/${i} ~/.local/bin/wezterm
# done

echo "flatpak run org.wezfurlong.wezterm" > $HOME/.local/bin/wezterm
chmod a+x $HOME/.local/bin/wezterm
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /home/blake/.local/bin/wezterm 50
