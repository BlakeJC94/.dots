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

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color fg:#ebdbb2,bg:#1d2021,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
  --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'

export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
