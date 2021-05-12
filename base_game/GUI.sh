#!/bin/bash

HP_displayer()
{
    HP_max=$2
    HP_left=$3
    HP_bar=""
    i=0
    echo -e "$1"
    while [ $i -lt $HP_max ]
    do
        if [ $i -lt $HP_left ]
        then
            HP_bar+="I"
        elif [ $i -gt $HP_left ]
        then 
            HP_bar+="_"
        fi
        i=$(($i+1))
    done
    echo -e "HP: $HP_bar $HP_left / $HP_max"
}

char_HP_displayer()
{
    HP_max=$2
    HP_left=$3
    HP_bar=""
    i=0
    echo -e "$1"
    while [ $i -lt $HP_max ]
    do
        if [ $i == 0 ]
        then
            HP_bar+="0"
            i=$(($i+1))
        elif [ $i == 4 ] && [ $i -lt $HP_left ]
        then
            HP_bar+="["
            i=$(($i+1))
        elif [ $i -lt $HP_left ]
        then
            HP_bar+="="
        elif [ $i -eq $HP_left ]
        then
            HP_bar+=">"
        elif [ $i -gt $HP_left ]
        then 
            HP_bar+=" "
        fi
        i=$(($i+1))
    done
    echo -e "HP: $HP_bar $HP_left / $HP_max\n"
}

GUI()
{
    echo -e "========== FLOOR $floor_nb ==========\n"
    HP_displayer "\e[31m${enemy[name]}\e[0m" ${enemy[max_hp]} ${enemy[hp_left]}
    char_HP_displayer "\e[92m${player[name]}\e[0m" ${player[max_hp]} ${player[hp_left]}
}
