alias duh='du -d 1 -h'
alias myip='curl http://ifconfig.me/ip'
alias bc='bc -l'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'
alias cpuinfo='lscpu'
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
alias wget='wget -c'  # Resume wget by default
alias mkdir="mkdir -pv"  # Make parent dirs verbosely

# Quick cd command
alias c='cd "$(find . -maxdepth 1 -type d | fzf)"'
alias C='cd "$(find . -type d | fzf)"'
# Quick project navigation command
alias g='cd $(fd ".git$" ~/Workspace/repos -H -I -d 5 -x dirname {} \; | fzf)'
alias t='tmux'
alias T='tmux-sessionizer'
alias a='tmux a'
alias d='tmux detach'
# Quick arglist filler for vim
alias vimm='vim $(find -type f -not -path '\''*/\.git/*'\'' -printf '\''%P\n'\'' | fzf -m | tr '\'' '\'' _)'
# Muscle memory
alias q="exit"
alias G="git"
alias Git="git"
# alias vim="nvim"
# alias vm="/usr/bin/vim"

# More aliases
alias less="less -R"
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"

pip-recompile () { for i; do [[ "$i" == "requirements"*".txt" ]] && echo "==> Compiling $i" && grep "^#\s\{4\}pip-compile" "$i" | sed 's/#\s\+//' | bash; done; }
