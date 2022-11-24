# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# disable <C-s> from pausing input to terminal
stty -ixon

source $HOME/.dots/bash/modules/history.sh
source $HOME/.dots/bash/modules/color_prompt.sh
source $HOME/.dots/bash/modules/window_title.sh
source $HOME/.dots/bash/modules/completion.sh
source $HOME/.dots/bash/modules/tab_cycle.sh

# Stick dots onto the path
export PATH="${HOME}/.dots/bin:${PATH}"

# Alias definitions.
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# Run twolfson/sexy-bash-prompt
[ -f ~/.bash_prompt ] && source ~/.bash_prompt

# source bash_profile if present
[ -f ~/.bash_profile ] && source ~/.bash_profile

source $HOME/.dots/bash/modules/tmux.sh

source $HOME/.dots/bash/modules/qt.sh
source $HOME/.dots/bash/modules/git.sh
source $HOME/.dots/bash/modules/tex.sh
source $HOME/.dots/bash/modules/nvm.sh
source $HOME/.dots/bash/modules/pyright.sh
source $HOME/.dots/bash/modules/pyenv.sh
source $HOME/.dots/bash/modules/rust.sh
source $HOME/.dots/bash/modules/jill.sh

source $HOME/.dots/bash/modules/fzf.sh
source $HOME/.dots/bash/modules/vim.sh
source $HOME/.dots/bash/modules/fortune.sh
