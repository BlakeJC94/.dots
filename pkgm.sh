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
    "tldr"
    "uv"
    "duckdb"
    "tree"
    "pandoc"
    "shellcheck.net"
    "shfmt"
    "prettier"
)
for item in "${list[@]}"; do
    pkgm install $item
done

