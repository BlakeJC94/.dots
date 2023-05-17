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

# Add local bins to path
export PATH_LOCAL_BIN="${HOME}/.local/bin"
[[ ":$PATH:" != *":${PATH_LOCAL_BIN}:"* ]] && PATH="${PATH_LOCAL_BIN}:${PATH}"

source $HOME/.bash/modules/history.sh
source $HOME/.bash/modules/color_prompt.sh
source $HOME/.bash/modules/window_title.sh
source $HOME/.bash/modules/completion.sh
source $HOME/.bash/modules/tab_cycle.sh
# source $HOME/.bash/modules/qt.sh


# Alias definitions.
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# Run twolfson/sexy-bash-prompt
[ -f ~/.bash_prompt ] && source ~/.bash_prompt


# TODO put into module
[ -f /home/linuxbrew/.linuxbrew/bin/brew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
[ -f $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh ] && source $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh

# TODO replace this with a for loop and source from repo
[ -f ~/.bash/modules/asdf.sh ] && source $HOME/.bash/modules/asdf.sh
[ -f ~/.bash/modules/flatpak.sh ] && source $HOME/.bash/modules/flatpak.sh
[ -f ~/.bash/modules/tmux.sh ] && source $HOME/.bash/modules/tmux.sh
[ -f ~/.bash/modules/direnv.sh ] && source $HOME/.bash/modules/direnv.sh

[ -f ~/.bash/modules/git.sh ] && source $HOME/.bash/modules/git.sh
[ -f ~/.bash/modules/tex.sh ] && source $HOME/.bash/modules/tex.sh
[ -f ~/.bash/modules/pyright.sh ] && source $HOME/.bash/modules/pyright.sh

[ -f ~/.bash/modules/fzf.sh ] && source $HOME/.bash/modules/fzf.sh
[ -f ~/.bash/modules/fortune.sh ] && source $HOME/.bash/modules/fortune.sh

[ -f ~/.bash_profile_work.sh ] && source ~/.bash_profile_work.sh
