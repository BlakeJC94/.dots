# git status alias
alias g='git status'
# quick cd command
alias c='cd "$(find . -type d | fzf)"'
# quick project navigation command
alias p='cd "$(find ~ ~/Workspace/repos -mindepth 1 -maxdepth 1 -type d | fzf)"'
# muscle memory
alias :q="exit"
alias :Q="exit"

# More aliases
alias aptup="sudo apt update && sudo apt upgrade -y"
alias matlabcli="matlab -nodisplay"
alias bat="batcat"
alias icat="kitty +kitten icat"
alias upgit="git add . && git commit -m 'sync' && git push"
alias less="less -R"
alias nv="nvim"
alias python="python3"
alias ipython="ipython3"

# Simple custom functions
function mann() {
    curl --silent "https://cheat.sh/$1" | less -R
}

function mkcd() {
    if [[ $# -eq 0 ]] ; then
        echo 'Alias for mkdir and cd'
        echo '  Usage: user@pc~/path/:$ wat [search query]'
    else
        mkdir -p "$1" && cd "$1"
    fi
}

function wat() {
    if [[ $# -eq 0 ]] ; then
        echo 'Search online using `wat`'
        echo '  Usage: user@pc~/path/:$ wat [search query]'
    else
        search_term="${*}"
        search_term="${search_term// /+}"
        firefox https://www.ecosia.org/search?q=${search_term} &
    fi
}

function watt() {
    if [[ $# -eq 0 ]] ; then
        echo 'Google things using `watt`'
        echo '  Usage: user@pc~/path/:$ watt [search query]'
    else
        search_term="${*}"
        search_term="${search_term// /+}"
        firefox https://www.google.com.au/search?q=${search_term} &
    fi
}
