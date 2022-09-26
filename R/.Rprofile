user_lib_path = "~/.local/share/R/lib"

if (!file.exists(user_lib_path)){
    print("[~/.Rprofile] : Creating lib path")
    dir.create(user_lib_path, recursive=TRUE)
}

.libPaths(user_lib_path)

