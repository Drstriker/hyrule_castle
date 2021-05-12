#!/bin/bash

# Game management in function of floor and enemies

game_manager()
{
    if [ $floor_nb -lt 10 ] && [ ${enemy[hp_left]} -le 0 ] 
    then
        floor_nb=$(($floor_nb+1))
        enemy_setter
    fi

    if [ $floor_nb -eq 10 ] && [ $is_in_boss -eq 0 ]
    then
        is_in_boss=1
        enemy_file="csv_files/bosses.csv"
        enemy_setter
    fi

    if [ $floor_nb -eq 10 ] && [ ${enemy[hp_left]} -le 0 ]
    then
        echo -e " === CONGRATULATIONS ===\n"
        exit 125
    fi
}
