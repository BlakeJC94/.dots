if ! [[ "$(command -v pyenv)" ]]; then
    curl https://pyenv.run | bash
else
    pyenv update
fi

