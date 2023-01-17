# print a fortune when starting up a bash session
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    codehelp
fi
