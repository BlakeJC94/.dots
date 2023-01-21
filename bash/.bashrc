# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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

# Alias definitions.
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# Run twolfson/sexy-bash-prompt
[ -f ~/.bash_prompt ] && source ~/.bash_prompt

# Source bash_profile if present
[ -f ~/.bash_profile ] && source ~/.bash_profile

# TODO replace this with a for loop and source from repo
source $HOME/.bash/modules/tmux.sh

source $HOME/.bash/modules/qt.sh
source $HOME/.bash/modules/git.sh
source $HOME/.bash/modules/tex.sh
source $HOME/.bash/modules/nvm.sh
source $HOME/.bash/modules/pyright.sh
source $HOME/.bash/modules/pyenv.sh
source $HOME/.bash/modules/rust.sh
source $HOME/.bash/modules/jill.sh

source $HOME/.bash/modules/fzf.sh
source $HOME/.bash/modules/vim.sh
source $HOME/.bash/modules/fortune.sh

# TODO make this private by sourcing a linker in other repo
[ -f ~/.bash/modules/aws-sso.sh ] && source ~/.bash/modules/aws-sso.sh
[ -f ~/.bash/modules/seerflow.sh ] && source ~/.bash/modules/seerflow.sh
