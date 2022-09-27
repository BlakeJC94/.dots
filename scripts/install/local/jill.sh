if ! [[ "$(command -v jill)" ]]; then
    wget https://raw.githubusercontent.com/abelsiqueira/jill/main/jill.sh ${HOME}/.local/opt/jill.sh
    chmod a+x  ${HOME}/.local/bin/jill
    ln -sf ${HOME}/.local/opt/jill.sh ${HOME}/.local/bin/jill
fi
jill


