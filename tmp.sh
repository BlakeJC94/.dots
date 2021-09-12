INSTALLS=$(find install_scripts/ -type f -not -name "__template__.sh" | sort)
CONFIRMED_INSTALLS=( )


echo "--------"
echo "Found install scripts:"
for i in ${INSTALLS}; do
    echo $i | sed 's/install_scripts\//  * /g'
done
echo "--------"

read -p "Install all programs? (Y/n) : " install_all
if [ -z $install_all ]; then
    install_all="n"
fi

if [ $install_all != "Y" ]; then

    read -p "Install some programs?" install_some
    if [ -z $install_some ]; then
        install_some="n"
    fi

    if [ $install_some != "Y" ]; then
        echo "Install cancelled"
        exit
    fi

    for i in ${INSTALLS}; do
        read -p "$(echo $i | sed 's/install_scripts\//    Install /g')? (Y/n) : " install_i
        if [ -z $install_i ]; then
            install_i="n"
        fi
        if [ $install_i = "Y" ]; then
            CONFIRMED_INSTALLS+=( $i )
        fi
    done

    echo "--------"
    echo "Confirm install scripts:"
    for i in ${CONFIRMED_INSTALLS[@]}; do
        echo $i | sed 's/install_scripts\//  * /g'
    done
    echo "--------"
    read -p "Install selected programs? (Y/n) : " install_selected
    if [ -z $install_selected ]; then
        install_selected="n"
    fi

else
    CONFIRMED_INSTALLS=${INSTALLS[@]}
fi


if [ $install_all = "Y" ] || [ $install_selected = "Y" ]; then
    for j in ${CONFIRMED_INSTALLS[@]}; do
        sudo bash $j
    done
else
    echo "Install cancelled"
    exit
fi

#for i in ${INSTALLS}; do
#    CONFIRMED_INSTALLS+=($i)
#done
#
#for j in ${CONFIRMED_INSTALLS[@]}; do
#    echo $j
#done
