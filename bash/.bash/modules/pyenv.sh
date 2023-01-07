# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PYTHONPATH=.
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
if [[ "$(command -v pyenv)" ]]; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi


