
for DIR in $(find ./.config -mindepth 1 -maxdepth 1 -type d | sed 's/\.\/\.config\///'); do
    DEST=$HOME/.dots/.config/$DIR
    TARGET=$HOME/.config/$DIR
    ln -sf $DEST $TARGET
done
