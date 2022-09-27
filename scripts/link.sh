#!/usr/bin/env bash

echo "==> Deploying dotfiles"

# Get list of top level directories
DIRS_TO_SET_UP=$( \
    find $HOME/.dots \
        -maxdepth 1 -mindepth 1 \
        -type d \
        -not \( -name 'scripts' -or -name '.*' \) \
)

for DIR in ${DIRS_TO_SET_UP}; do
    DIRNAME=$(basename "${DIR}")
    echo "--> Setting up ${DIRNAME}"

    # Get $HOME files and dirs to link
    #   * Match files/dirs in DIR that begin with '.'
    #   * Exclude DIR/.config
    #   * Match files/dirs one level in DIR/.config
    #   * Match files/dirs one level in DIR/bin
    PATHS_TO_LINK=$( \
        find ${DIR}  \
            -name '.*' \
            -and -not -name '.config' \
            -or -path '*/.config/*' -prune \
            -or -path '*/bin/*' \
    )

    # Remove .dots/DIR/ from source path and create symlink
    for SOURCE in ${PATHS_TO_LINK}; do
        STEMNAME=$(basename $(dirname ${SOURCE}))

        NEWSTEM=''
        if [ ${DIRNAME} = 'bin' ]; then
            NEWSTEM='.local\/bin\/'
        elif [ ${STEMNAME} = 'bin' ]; then
            NEWSTEM='.local\/'
        fi

        DEST=$(echo ${SOURCE} | sed "s/\.dots\/${DIRNAME}\//${NEWSTEM}/")

        if [ -L ${DEST} ] ; then
            if [ -e ${DEST} ] ; then
                echo "Good link"
            else
                echo "Broken link"
            fi
            unlink ${DEST}
        elif [ -e ${DEST} ] ; then
            echo "Not a link"
            mv ${DEST} ${DEST}.dots.bak
        else
            echo "Missing"
        fi
        ln -sf ${SOURCE} ${DEST}
        # echo "DRYRUN: ln -s"  ${SOURCE} ${DEST}
    done
done

# Make bin scripts executable
find "${HOME}/.dots/bin" -type f exec chmod a+x "{}" \; 2> /dev/null

echo "==> Done!"