list=(
    "mdformat"
    "aider"
    "pre-commit"
    "python-lsp-server"
    "rust-just"
    "datasette"
    "sqlite-utils"
    "vim-vint"
)

for item in "${list[@]}"; do
    uv tool install $item
done
