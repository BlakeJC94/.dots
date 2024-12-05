# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export DISABLE_MAGIC_FUNCTIONS=true

if [ -d "${ZSH}" ]; then
    source $HOME/.zsh/oh_my_zsh.zsh
fi


# User configuration

export PATH=$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Newline prompt https://stackoverflow.com/questions/41017917/add-newline-to-oh-my-zsh-theme
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %

{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "\n➜%{%f%}"
  CURRENT_BG=''
}

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Quick cd command
alias c='cd "$(find . -maxdepth 1 -type d | fzf)"'
alias C='cd "$(find . -type d | fzf)"'
# Quick project navigation command
alias g='cd $(fd ".git$" ~/Workspace/repos -H -I -d 5 -x dirname {} \; | fzf)'
# Tmux
alias t='tmux'
alias a='tmux a'
alias d='tmux detach'
# Muscle memory
alias q="exit"
alias G="git"
alias Git="git"

mcdir () { mkdir "$1" && cd "$_" }
joke () { curl https://icanhazdadjoke.com/; echo "" }
shitcommit () { curl https:///whatthecommit.com/index.txt; echo "" }

[ -f ~/.bash/modules/asdf.sh ] && source $HOME/.bash/modules/asdf.sh
[ -f ~/.bash/modules/tex.sh ] && source $HOME/.bash/modules/tex.sh
[ -f ~/.bash/modules/fzf.sh ] && source $HOME/.bash/modules/fzf.sh
# [ -f ~/.bash/modules/fortune.sh ] && source $HOME/.bash/modules/fortune.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/blake/.google-cloud-sdk/path.zsh.inc' ]; then . '/Users/blake/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/blake/.google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/blake/.google-cloud-sdk/completion.zsh.inc'; fi

command -v montuflow > /dev/null && source <(montuflow -- --completion)
command -v uv > /dev/null && source <(uv --generate-shell-completion zsh)

_uv_run_mod() {
    if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
        _arguments '*:filename:_files'
    else
        _uv "$@"
    fi
}
compdef _uv_run_mod uv
