##
# Env vars

# Replace MacOS standard tools with Unix standard tools
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"

# Add local executable commands
export PATH="$HOME/.local/bin:$PATH"

# Language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Force python to import stuff in wd
export PYTHONPATH=.

# Using Vim from pkgx
export VIMRUNTIME=~/.local/pkgs/vim.org/v9/share/vim/vim91

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"

# ...
export CLOUDSDK_PYTHON_SITEPACKAGES=1


# Aliases
[ -f ~/.aliases.sh ] && source ~/.aliases.sh


# Intiliase Brew package manager
eval "$(/opt/homebrew/bin/brew shellenv)"

# Initialise Starship prompt
eval "$(starship init zsh)"

# Initialise FZF
source <(fzf --zsh)

# Ensure the emacs bindings are working
bindkey -e


[ -f ~/.bash/modules/asdf.sh ] && source $HOME/.bash/modules/asdf.sh
[ -f ~/.bash/modules/tex.sh ] && source $HOME/.bash/modules/tex.sh
[ -f ~/.bash/modules/fzf.sh ] && source $HOME/.bash/modules/fzf.sh


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/blake/.google-cloud-sdk/path.zsh.inc' ]; then . '/Users/blake/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/blake/.google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/blake/.google-cloud-sdk/completion.zsh.inc'; fi


# Shell completions for uv
command -v uv > /dev/null && source <(uv --generate-shell-completion zsh)
_uv_run_mod() {
    if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
        _arguments '*:filename:_files'
    else
        _uv "$@"
    fi
}
compdef _uv_run_mod uv

# Shell completions for montuflow
command -v montuflow > /dev/null && source <(montuflow -- --completion)
