shopt -s globstar
for f in "${HOME}"/.install/*.sh; do
    bash "${f}" -- 2>&1 > "${f}".log
done

