# ~/.zshrc: executed by zsh(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


##
# Settings


# Ensure the emacs bindings are working
bindkey -e


##
# Env vars

# Setup common env vars
[ -f ~/.envvars.sh ] && source ~/.envvars.sh

# Replace MacOS standard tools with Unix standard tools
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"

# Using Vim from pkgx
export VIMRUNTIME=~/.local/pkgs/vim.org/v9/share/vim/vim91

# ...
export CLOUDSDK_PYTHON_SITEPACKAGES=1


##
# Aliases

# Setup common alias definitions
[ -f ~/.aliases.sh ] && source ~/.aliases.sh


##
# Initialisers

# Intiliase Brew package manager
eval "$(/opt/homebrew/bin/brew shellenv)"

# Initialise Starship prompt
eval "$(starship init zsh)"

# Initialise FZF
source <(fzf --zsh)

# Initisliase asdf
[ -f $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh ] && source $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh


##
# Extras

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

# Netskope CLI Certificate Fix
netskope_fp=/opt/montu-kandji/netskope-cli-certificate-fix.sh
if [ -f "${netskope_fp}" ]; then
    source "${netskope_fp}"
fi
