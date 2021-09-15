# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# lazygit alias
alias g='lazygit'

# More aliases
alias aptup="sudo apt update && sudo apt upgrade -y"
alias matlabcli="matlab -nodisplay"
alias lsl="ls -lhFA | less"
alias :q="exit"
alias bat="batcat"
alias gitup="git commit -a && git push"

# Simple custom functions
function mann() {
    curl --silent "https://cheat.sh/$1" | less -R
}
function mkcd() {
    mkdir -p "$1" && cd "$1"
}

function wat() {
    search_term="${*}"
    search_term="${search_term// /+}"
    firefox https://www.ecosia.org/search?q=${search_term} &
}

function watt() {
    search_term="${*}"
    search_term="${search_term// /+}"
    firefox https://www.google.com.au/search?q=${search_term} &
}


# simple function to make and run c programs
function crun { make $1 && ./$1; }

