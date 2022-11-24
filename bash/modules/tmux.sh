# Automatically launch Tmux in Wezterm
if [ -n "${WEZTERM_PANE}" ] || [ -n "${KITTY_WINDOW_ID}" ] && [ -z "${TMUX}" ] ; then
    N=$(tmux ls 2> /dev/null | grep -v attached | head -1 | cut -d: -f1)
    if [[ -n $N ]]; then
        tmux attach -t "${N}" && exit;
    else
        tmux new-session && exit;
    fi
fi


