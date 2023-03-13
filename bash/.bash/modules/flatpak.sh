flatpak_xdg=/var/lib/flatpak/exports/share
if ! [[ "$XDG_DATA_DIRS" =~ (^|:)"${flatpak_xdg}"(:|$) ]]
then
    export XDG_DATA_DIRS="${flatpak_xdg}:$XDG_DATA_DIRS"
fi
