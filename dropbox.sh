
function red {
    RED='\033[0;31m'
    printf "%s%s%s\n" "$RED" "$@" "$NC"
}

function green {
    GREEN='\033[0;32m'
    printf "%s%s%s\n" "$GREEN" "$@" "$NC"
}

function yellow {
    YELLOW='\033[0;33m'
    printf "%s%s%s\n" "$YELLOW" "$@" "$NC"
}

set -eu -o pipefail # fail on error and report it, debug all lines
sudo -n true
test $? -eq 0 || exit 1 "you should have sudo privilege to run this script"

echo -e "$(yellow "\nSetting up dropbox\n")"
$HOME/.dropbox-dist/dropboxd &

echo -e "$(yellow "Started Dropbox, login at browser then press any key to continue\n")"
read -n 1 k <&1

echo -e "$(yellow "Waiting for sync to start before adding exclusions\n")"
sleep 20
dropbox exclude add Dropbox/Archived/

echo -e "$(yellow "Once syncing of home and workspace starts, press any key to continue\n")"
read -n 1 k <&1

DIRS=( Desktop Documents Music Pictures Videos Public  )
for DIR in "${DIRS[@]}"; do
    echo "Replacing $DIR"
    mv $HOME/$DIR $HOME/.$DIR.bak
    ln -sf $HOME/Dropbox/Home-db/$DIR-db $HOME/$DIR
done

WORKDIRS=( archive langs scratch notebooks )
mkdir -p $HOME/Workspace/repos
mkdir -p $HOME/Workspace/data
for DIR in "${WORKDIRS[@]}"; do
    ln -sf $HOME/Dropbox/Home-db/Workspace-db/$DIR $HOME/Workspace/$DIR
done

mkdir -p $HOME/.local/share/zotero
ln -fs $HOME/Dropbox/Apps/Zotero/storage $HOME/.local/share/zotero/storage

echo -e "$(yellow "Double check sync exlusions, startup options, and symlinks\n")"
echo -e "$(green "\nFinished setting up dropbox\n")"
