list=(
    "bat"
    "ctags"
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
)
for item in "${list[@]}"; do
    pkgm install $item
done

