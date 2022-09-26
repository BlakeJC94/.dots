# Automatically launch Tmux in Kitty
if ! [ -z "$KITTY_WINDOW_ID" ] || ! [ -z "$WEZTERM_PANE" ] && [ -z "$TMUX" ]; then
    if [[ "$(command -v tmux)" ]]; then
        N=$(tmux ls | grep -v attached | head -1 | cut -d: -f1)
        if [[ ! -z $N ]]
        then
            exec tmux attach -t $N && exit;
        else
            exec tmux new-session && exit;
        fi
    fi
fi


