#!/bin/bash


combat_manager()
{
    if [ ${enemy[hp_left]} -gt 0 ] && [ ${player[hp_left]} -gt 0 ]
    then
        echo "----------Options-----------"
        echo -e "1. Attack   2. Heal   3. Quit\n"
    fi

    echo -e "You are fighting a \e[31m${enemy[name]}\e[0m\n"

    if [ ${enemy[hp_left]} -le 0 ]
    then
        echo -e "\e[31m${enemy[name]}\e[0m died!\n"
    fi

    printf "=== Your choice : "
    read option
    clear

    if [ $option == 1 ]
    then
        attack
    elif [ $option == 2 ]
    then
        heal=$((${player[max_hp]} / 2))
        player[hp_left]=$((${player[hp_left]} + $heal))
        if [ ${player[hp_left]} -gt ${player[max_hp]} ]
        then
            player[hp_left]=${player[max_hp]}
        fi
        echo -e "You healed \e[92m$heal\e[0m HP!\n"
    elif [ $option == 3 ]
    then
        echo -e "=== You left the game ===\n"
        exit 125
    elif [ $option != 1 ] || [ $option != 2 ] || [ $option != 3 ]
    then
        echo -e "Enter '1', '2' or '3'!\n"
    fi

    if [ ${enemy[hp_left]} -gt 0 ] && ([ $option == 1 ] || [ $option == 2 ])
    then
        player[hp_left]=$((${player[hp_left]} - ${enemy[str]}))
        echo -e "\e[31m${enemy[name]}\e[0m attacked and dealt \e[31m${enemy[str]}\e[0m damages!\n"
    fi
}

end_fight_manager()
{
    if [ ${enemy[hp_left]} -le 0 ]
    then
        GUI
        echo -e "\e[31m${enemy[name]}\e[0m died!\n"
        echo -e "=== Press any key to continue ===\n"
        read key
        clear
    elif [ ${player[hp_left]} -le 0 ]
    then
        echo -e " === YOU DIED ===\n"
        exit 125
    fi
}

attack()
{
    enemy[hp_left]=$((${enemy[hp_left]} - ${player[str]}))
    echo -e "You attacked and dealt \e[31m${player[str]}\e[0m damages!\n"
}
