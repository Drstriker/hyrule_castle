#!/bin/bash

source ./combat_manager.sh
source ./game_manager.sh
source ./settings.sh
source ./GUI.sh

declare -A player
declare -A enemy

enemy_file="csv_files/enemies.csv"

# Game mainloop

main()
{
    clear
    floor_nb=1
    dmgs=0
    is_in_boss=0
    player_setter
    enemy_setter
    while true
    do
        GUI
        combat_manager
        end_fight_manager
        game_manager
    done
}

main
