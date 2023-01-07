get_dirs(){ 
    find "${DOTS}" \
        -maxdepth 1 -mindepth 1 \
        -type d \
        -not -regex '.*\(scripts\|extras\|\.git\|\.archived\)' \
        -print0 
}
