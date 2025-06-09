if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Netskope CLI Certificate Fix
netskope_fp=/opt/montu-kandji/netskope-cli-certificate-fix.sh
if [ -f "${netskope_fp}" ]; then
    source "${netskope_fp}"
fi
