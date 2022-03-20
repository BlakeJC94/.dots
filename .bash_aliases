# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# git status alias
alias g='git status'

# quick cd command
alias c='cd "$(find . -type d | fzf)"'
# quick see command
alias s='see "$(fzf)"'

# More aliases
alias aptup="sudo apt update && sudo apt upgrade -y"
alias matlabcli="matlab -nodisplay"
alias lsl="ls -lhFA | less"
alias :q="exit"
alias :Q="exit"
alias bat="batcat"
alias icat="kitty +kitten icat"
alias upgit="git add . && git commit -m 'sync' && git push"
alias less="less -R"
alias nv="nvim"

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

function sess() {
    if [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; then
        echo 'Run or create session scripts using `sess`'
        echo '  Usage: user@pc~/path/:$ sess'
        echo '  Optional args: '
        echo '    -e --edit : launch editor on session script'
        echo '    -h --help : show this function info'
    else
        SESSIONS=( $(find $HOME/.sessions/ -type f | sort) )
        IDX=0
        echo "  $IDX : [New session]"
        for i in ${SESSIONS[@]}; do
            ((IDX++))
            echo "  $IDX : $i" | sed 's/\/.*\.sessions\///g'
        done

        read -p "Select session : " -n 3 selection


        if ! [[ -z $selection ]]; then

            if ! [[ $selection =~ ^[0-9]+$ ]] ; then
                echo "    error: Not a number"

            elif [[ $selection -eq 0 ]]; then
                echo "    selected [New session]"
                read -p "Name of  : " new_session_name
                $EDITOR $HOME/.sessions/$new_session_name.sh

            elif [[ $selection -le $IDX ]]; then
                ((selection--))
                selected_session=${SESSIONS[$selection]}
                if [[ $1 == '-e' ]] || [[ $1 == '--edit' ]]; then
                    echo "    editing a session : $selected_session"
                    $EDITOR $selected_session
                else
                    echo "    selected a session : $selected_session"
                    source $selected_session
                fi

            else
                echo "    error: Out of bounds"
            fi
        fi
    fi
}

# simple function to make and run c programs
function crun { make $1 && ./$1; }

