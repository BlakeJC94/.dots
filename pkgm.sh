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
    "tldr"
    "uv"
)
for item in "${list[@]}"; do
    pkgm install $item
done

