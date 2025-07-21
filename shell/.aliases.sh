alias ls='ls --color=auto'
alias duh='du -d 1 -h'
alias myip='curl http://ifconfig.me/ip'
alias wttr='curl https://wttr.in/'
alias least='fmt -w 80 | bat --paging always --style plain'
alias leastmd='least -l markdown'

alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
alias todo='rg -o --hidden --iglob "!.git" --iglob "!TODO.md" "TODO.*"'

# mcdir () { mkdir "$1" && cd "$_" }
# joke () { curl https://icanhazdadjoke.com/; echo "" }
# shitcommit () { curl https:///whatthecommit.com/index.txt; echo "" }


# Quick cd command
alias c='cd "$(find . -maxdepth 1 -type d | fzf)"'
alias C='cd "$(find . -type d | fzf)"'
# Quick project navigation command
alias g='cd $(fd ".git$" ~/Workspace/repos -H -I -d 5 -x dirname {} \; | fzf)'
alias t='tmux'
alias a='tmux a'
alias d='tmux detach'
# Quick arglist filler for vim
alias vimm='vim $(find -type f -not -path '\''*/\.git/*'\'' -printf '\''%P\n'\'' | fzf -m | tr '\'' '\'' _)'
# Muscle memory
alias q="exit"
alias G="git"
alias Git="git"

# More aliases
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
