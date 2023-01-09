shopt -s globstar
for f in /home/"${SUDO_USER}"/.install/sudo/*.sh; do
    bash "${f}" -- 2>&1 > "${f}".log
done

