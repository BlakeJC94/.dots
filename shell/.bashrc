# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


##
# Settings

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Disable <C-s>/<C-q> from pausing/resuming input to terminal
stty -ixon

source $HOME/.bash/modules/history.sh
source $HOME/.bash/modules/color_prompt.sh
source $HOME/.bash/modules/window_title.sh
source $HOME/.bash/modules/completion.sh
source $HOME/.bash/modules/tab_cycle.sh

##
# Env vars

# Setup common env vars
[ -f ~/.envvars.sh ] && source ~/.envvars.sh


##
# Aliases

# Setup common alias definitions
[ -f ~/.aliases.sh ] && source ~/.aliases.sh


##
# Initialisers

# Linuxbrew
[ -f /home/linuxbrew/.linuxbrew/bin/brew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Initialise Starship prompt
eval "$(starship init bash)"

# Initialise FZF
source <(fzf --bash)

# Initisliase asdf
[ -f $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh ] && source $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh


# TODO rfc
[ -f ~/.bash/modules/tex.sh ] && source $HOME/.bash/modules/tex.sh
[ -f ~/.bash/modules/fortune.sh ] && source $HOME/.bash/modules/fortune.sh
