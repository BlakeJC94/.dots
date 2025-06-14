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
export PYTHONPATH=.
export VIMRUNTIME=~/.local/pkgs/vim.org/v9/share/vim/vim91
export CLOUDSDK_PYTHON_SITEPACKAGES=1

source <(fzf --zsh)

[ -f ~/.aliases.sh ] && source ~/.aliases.sh

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

# Netskope CLI Certificate Fix
netskope_fp=/opt/montu-kandji/netskope-cli-certificate-fix.sh
if [ -f "${netskope_fp}" ]; then
    source "${netskope_fp}"
fi
