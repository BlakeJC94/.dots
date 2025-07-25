# Setup fzf
# ---------
if [[ ! "$PATH" == */home/linuxbrew/.linuxbrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/linuxbrew/.linuxbrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/linuxbrew/.linuxbrew/opt/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
[ -f "/home/linuxbrew/.linuxbrew/opt/fzf/shell/key-bindings.bash" ] && source "/home/linuxbrew/.linuxbrew/opt/fzf/shell/key-bindings.bash"
[ -f "/System/Volumes/Data/opt/homebrew/opt/fzf/shell/key-bindings.zsh" ] && source "/System/Volumes/Data/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

