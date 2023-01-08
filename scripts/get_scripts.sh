get_scripts() {
    local root_dir
    root_dir="${1}"

    find "${root_dir}" \
        -name '*.sh' \
        -print0
}
