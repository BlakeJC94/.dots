#!/usr/bin/env bash

# TODO check for dead links that are meant to link to .dots and remove
link_dotfiles() {
    mkdir -pv "${HOME}"/.local/bin "${HOME}"/.local/opt

    # Get list of top level directories
    local dirs_to_set_up
    dirs_to_set_up=$( \
        find $HOME/.dots \
            -maxdepth 1 -mindepth 1 \
            -type d \
            -not \( -name 'scripts' -or name 'extras' -or -name '.*' \) \
    )
    for dir in ${dirs_to_set_up}; do
        local dir_name
        dir_name=$(basename "${dir}")
        echo "==>==> Setting up ${dir_name}"

        # Get $HOME files and dirs to link
        #   * Match files/dirs in dir that begin with '.'
        #   * Exclude dir/.config
        #   * Match files/dirs one level in dir/.config
        paths_to_link=$( \
            find ${dir}  \
                -name '.*' \
                -and -not -name '.config' \
                -or -path '*/.config/*' -prune
        )

        # Remove .dots/dir/ from source path and create symlink
        for source in ${paths_to_link}; do
            local stem_name
            stem_name=$(basename $(dirname ${source}))

            local new_stem
            new_stem=''
            if [ ${stem_name} = 'bin' ]; then
                new_stem='.local\/'
            fi

            local dest
            dest=$(echo ${source} | sed "s/\.dots\/${dir_name}\//${new_stem}/")

            if [ -L ${dest} ] ; then
                if [ -e ${dest} ] ; then
                    echo "Good link"
                else
                    echo "Broken link"
                fi
                unlink ${dest}
            elif [ -e ${dest} ] ; then
                echo "Not a link"
                mv ${dest} ${dest}.dots.bak
            else
                echo "Missing"
            fi

            ln -sf ${source} ${dest}
            # echo "DRYRUN: ln -s"  ${source} ${dest}
        done
    done
}

main() {
    link_dotfiles
}

main || exit 1
