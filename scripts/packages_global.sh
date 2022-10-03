# Check if sudo was used
if [[ $(id -u) -ne 0 ]] ; then
    echo "Please run as root to update APT packages." ;
    exit 1
fi
# Use non-interactive sudo and patch `$HOME`
# sudo -n true
# HOME=$(getent passwd $SUDO_USER | cut -d: -f6)


# UPDATE AND UPGRADE APT
apt update
apt upgrade -y


# INSTALL COMMAND LINE TOOLS
source ${HOME}/.dots/scripts/install/global/tools_apt.sh
source ${HOME}/.dots/scripts/install/global/tools_flatpak.sh

# INSTALL DEPENDENCIES
# source ${HOME}/.dots/scripts/install/global/deps_brew.sh
# source ${HOME}/.dots/scripts/install/global/deps_build_ncspot.sh
source ${HOME}/.dots/scripts/install/global/deps_pyenv.sh

# INSTALL OTHER STANDALONE APPLICATIONS
source ${HOME}/.dots/scripts/install/global/zathura.sh
source ${HOME}/.dots/scripts/install/global/wezterm.sh
source ${HOME}/.dots/scripts/install/global/aws.sh
source ${HOME}/.dots/scripts/install/global/tailscale.sh



