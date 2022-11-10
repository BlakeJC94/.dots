# Automatically launch Tmux in Wezterm
if [ -n "${WEZTERM_PANE}" ] || [ -n "${KITTY_WINDOW_ID}" ] && [ -z "${TMUX}" ] ; then
    N=$(tmux ls 2> /dev/null | grep -v attached | head -1 | cut -d: -f1)
    if [[ -n $N ]]; then
        # exec tmux attach -t "${N}" && exit;
        # echo "exec tmux attach -t" "${N}" "&& exit;"
        tmux attach -t "${N}" && exit;
    else
        # exec tmux new-session && exit;
        # echo "exec tmux new-session && exit;"
        tmux new-session && exit;
    fi
fi


