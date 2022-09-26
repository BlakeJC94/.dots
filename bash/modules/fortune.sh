# print a fortune when starting up a bash session
if [[ "$(command -v fortune)" ]] && [[ -f ~/.dots/extras/fortune/programming-tips ]]; then
    if [[ "$(command -v colorize)" ]]; then
        fortune $HOME/.dots/fortune/programming-tips | colorize magenta
    else
        fortune $HOME/.dots/fortune/programming-tips
    fi
fi

