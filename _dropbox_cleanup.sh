
DIRS=( Desktop Documents Music Pictures Videos Public  )
pushd ~/Dropbox/
for DIR in "${DIRS[@]}"; do
    echo "$DIR"
    unlink $HOME/$DIR
    # ln -sf $HOME/Dropbox/Home-db/$DIR-db $HOME/$DIR
done
popd
