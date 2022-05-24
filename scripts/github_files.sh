#!/bin/bash
function get_latest_files_from_github {
    # Args:
    #   $1 : user
    #   $2 : repo
    #   $3 : asset regex
    echo -e "\nDownloading ${3} from Github repo ${1}/${2}\n"
    curl -s https://api.github.com/repos/"$1"/"$2"/releases/latest \
        | grep browser_download_url \
        | grep $3 \
        | cut -d '"' -f 4 \
        | wget -nv -i -
    return 0
}
