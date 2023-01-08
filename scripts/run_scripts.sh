run_scripts() {
    arr=( "$@" )
    for i in "${!arr[@]}"; do
        bash "${arr[$i]}"
    done
}
