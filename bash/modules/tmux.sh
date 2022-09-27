# Automatically launch Tmux in Wezterm
# if ! [ -z "$KITTY_WINDOW_ID" ] || ! [ -z "$WEZTERM_PANE" ] && [ -z "$TMUX" ]; then

if [ -z "$TMUX" ] && [ -n "$WEZTERM_PANE" ] || [ -z "$TMUX" ] && [ -n "$KITTY_WINDOW_ID" ]; then
    if [[ "$(command -v tmux)" ]]; then
        N=$(tmux ls 2> /dev/null | grep -v attached | head -1 | cut -d: -f1)
        if [[ -n $N ]]; then
            exec tmux attach -t "${N}" && exit;
            # echo "exec tmux attach -t" "${N}" "&& exit;"
        else
            exec tmux new-session && exit;
            # echo "exec tmux new-session && exit;"
        fi
    fi
fi


