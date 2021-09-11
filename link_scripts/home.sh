
DIRS=( Desktop Documents Music Pictures Videos Public  )
for DIR in "${DIRS[@]}"; do
    echo "Replacing $DIR"
    mv $HOME/$DIR $HOME/.$DIR.bak
    ln -sf $HOME/Dropbox/Home-db/$DIR-db $HOME/$DIR
done
