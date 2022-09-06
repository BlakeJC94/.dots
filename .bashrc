# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# TeXmgr added config
# https://tex.stackexchange.com/questions/467824/is-it-possible-to-relocate-my-texmf-directory
export TEXMFHOME='~/.texmf'

# Run twolfson/sexy-bash-prompt
. ~/.bash_prompt


# make qt apps look nicer (after installing qt5-style-plugins)
export QT_QPA_PLATFORMTHEME=gtk2

# Set default editor to vim
export EDITOR=vim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FIX FOR PYRIGHT
# source : https://fabiorosado.dev/blog/pyright-worker-threads-missing/
export NODE\_OPTIONS=--experimental-worker

# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
if [[ "$(command -v pyenv)" ]]; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# if [[ "$(command -v pyenv)" ]]; then
#     eval "$(pyenv init --path)"
#     eval "$(pyenv init -)"
#     # export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# fi

# using vim as man pager
if [[ "$(command -v vim)" ]]; then
    # export EDITOR='vim'
    export MANPAGER='vim +Man!'
    # export MANWIDTH=999
fi

# Automatically launch Tmux in Kitty
if ! [ -z "$KITTY_WINDOW_ID" ] && [ -z "$TMUX" ]; then
    if [[ "$(command -v tmux)" ]]; then
        N=$(tmux ls | grep -v attached | head -1 | cut -d: -f1)
        if [[ ! -z $N ]]
        then
            exec tmux attach -t $N && exit;
        else
            exec tmux new-session && exit;
        fi
    fi
fi

# algodeploy tab completion
if [ -f ~/.bash_algodeploy ]; then
    . ~/.bash_algodeploy
fi

# disable <C-s> from pausing input to terminal
stty -ixon

# print a fortune when starting up a bash session
if [[ "$(command -v fortune)" ]] && [[ -f ~/.dots/extras/fortune/programming-tips ]]; then
    if [[ "$(command -v colorize)" ]]; then
        fortune $HOME/.dots/extras/fortune/programming-tips | colorize magenta
    else
        fortune $HOME/.dots/extras/fortune/programming-tips
    fi
fi


# Tab completion cycling

# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB:menu-complete'
bind '"\e[Z":menu-complete-backward'
# Display a list of the matching files
bind "set show-all-if-ambiguous on"
# Perform partial (common) completion on the first Tab press, only start
# cycling full results on the second Tab press (from bash version 5)
bind "set menu-complete-display-prefix on"
bind "set completion-ignore-case on"
# set single column for completion options
# bind 'set completion-display-width 1'

# source bash_profile if present
if [ -r $HOME/.bash_profile ]; then
    . $HOME/.bash_profile
fi

# init thefuck
if [[ "$(command -v thefuck)" ]]; then
    eval "$(thefuck --alias)"
fi

# init fzf
if [[ "$(command -v fzf)" ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.bash
    # source /usr/share/doc/fzf/examples/completion.bash  # not needed according to docs
fi


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/blake/google-cloud-sdk/path.bash.inc' ]; then . '/home/blake/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/blake/google-cloud-sdk/completion.bash.inc' ]; then . '/home/blake/google-cloud-sdk/completion.bash.inc'; fi

# seer gcloud stuff
export GOOGLE_APPLICATION_CREDENTIALS="/home/blake/.config/gcloud/legacy_credentials/blake@seermedical.com/adc.json"
export GCLOUD_PROJECT="seer-prod-au"

# Enable tab completion for seerflow
# `seerflow -- --completion > ~/.seerflow.sh`
if [ -f ~/.seerflow.sh ]; then
    source ~/.seerflow.sh
fi

