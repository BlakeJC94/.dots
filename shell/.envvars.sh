# Add local bins to path
export PATH_LOCAL_BIN="${HOME}/.local/bin"
[[ ":$PATH:" != *":${PATH_LOCAL_BIN}:"* ]] && export PATH="${PATH_LOCAL_BIN}:${PATH}"

# Language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Force python to import stuff in wd
export PYTHONPATH=.

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"

# LLM config location
export LLM_USER_PATH=$HOME/.config/llm

# FZF options
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color fg:#ebdbb2,bg:#1d2021,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
  --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"

