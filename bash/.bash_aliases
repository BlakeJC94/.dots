# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias ..='cd ..'
alias duh='du -d 1 -h'
alias myip='curl http://ifconfig.me/ip'
alias bc='bc -l'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='lscpu'
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
alias wget='wget -c'  # Resume wget by default
alias mkdir="mkdir -pv"  # make parent dirs verbosely

# git status alias
alias g='git status'
# quick cd command
alias c='cd "$(find . -maxdepth 1 -type d | fzf)"'
alias C='cd "$(find . -type d | fzf)"'
# quick project navigation command
alias p='cd "$(find ~/Workspace/repos ~/Workspace/scratch/ -mindepth 1 -maxdepth 2 -type d -or -type l | fzf)"'
# quick settings navigation command
alias s='cd "$(find ~/.config -mindepth 1 -maxdepth 1 -type d -or -type l | fzf)"'
# muscle memory
# alias :q="exit"
# alias :Q="exit"
alias q="exit"

# More aliases
alias matlabcli="matlab -nodisplay"
alias bat="batcat --theme=gruvbox-dark"
alias less="less -R"
# alias vm="vim"
# alias vim="nvim"
# alias python="python3"
# alias ipython="ipython3"

