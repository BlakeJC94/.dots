run_scripts() {
    # whoami 
    arr=("$@")
    for i in "${!arr[@]}"; do
        bash "${arr[$i]}"
        # echo "${arr[$i]}"
    done
}
