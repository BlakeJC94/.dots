get_scripts() {
    local root_dir
    root_dir="${1}"

    find "${root_dir}" \
        -type f \
        -name '*.sh' \
        -print0
}
