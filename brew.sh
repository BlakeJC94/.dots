list=(
    "bat"
    "ctags"
    "starship"
    "fd"
    "tmux"
    "fzf"
    "gh"
    "jq"
    "rg"
    "neofetch"
    "hugo"
    "teeldeer"
    "duckdb"
    "tree"
    "pandoc"
    "coreutils"
    "diffutils"
    "findutils"
    "awk"
    "gnu-sed"
    "grep"
    "nano"
    "git"
    "less"
    "curl"
    "wget"
    "bitwarden-cli"
)
for item in "${list[@]}"; do
    brew install $item
done

