#!/bin/bash
function get_latest_files_from_github {
    if [[ $# -eq 0 ]] ; then
        echo 'Get latest files from github'
        echo '  Usage: user@pc~/path/:$ get_latest_files_from_github [user] [repo] [asset regex]'
        return 1
    fi

    echo -e "\nDownloading ${3} from Github repo ${1}/${2}\n"
    curl -s https://api.github.com/repos/${1}/${2}/releases/latest \
        | grep browser_download_url \
        | cut -d '"' -f 4 \
        | grep download/.*/.*${3}$ \
        | wget -nv -i -
    return 0
}
