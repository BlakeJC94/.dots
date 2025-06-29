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
    "vim.org"
    "duckdb"
    "tree"
    "pandoc"
    "bw"
)
for item in "${list[@]}"; do
    pkgm install $item
done

