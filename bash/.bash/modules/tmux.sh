# Automatically launch Tmux in Wezterm
# if [ -n "${WEZTERM_PANE}" ] || [ -n "${KITTY_WINDOW_ID}" ] && [ -z "${TMUX}" ] ; then
#     N=$(tmux ls 2> /dev/null | grep -v attached | head -1 | cut -d : -f 1)
#     if [[ -n $N ]]; then
#         # If there's an unattached session, attach to it
#         tmux attach -t "${N}" && exit;
#     else
#         # Otherwise start a new session
#         tmux new-session && exit;
#     fi
# fi


