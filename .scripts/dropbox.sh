#!/bin/bash
echo "================"
echo "Starting dropbox"
$HOME/.dropbox-dist/dropboxd &

echo "Login at browser, press any key to continue"
read -n 1 k <&1

echo "Waiting for sync to start"
sleep 6

echo "Adding sync exclusions"
dropbox exclude add Dropbox/Archived/

echo "========================================="
echo "Replacing home dirs with links to dropbox"
DIRS=( Desktop Documents Music Pictures Videos Public  )
for DIR in "${DIRS[@]}"; do
    echo "Replacing $DIR"
    mv $HOME/$DIR $HOME/.$DIR.bak
    ln -sf $HOME/Dropbox/Home-db/$DIR-db $HOME/$DIR
done

echo "================================="
echo "Linking workspace dirs to dropbox"
WORKDIRS=( archive langs scratch notebooks )
mkdir -p $HOME/Workspace/repos
mkdir -p $HOME/Workspace/data
for DIR in "${WORKDIRS[@]}"; do
    ln -sf $HOME/Dropbox/Home-db/Workspace-db/$DIR $HOME/Workspace/$DIR
done

# echo "================================="
# echo "Linking zotero storage to dropbox"
# mkdir -p $HOME/.local/share/zotero
# ln -fs $HOME/Dropbox/Apps/Zotero/storage $HOME/.local/share/zotero/storage

echo "================================================="
echo "PASS! (Verify sync excl., stratup opts, symlinks)"
