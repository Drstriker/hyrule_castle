#!/bin/bash

player_rng()
{
    rand=$(($RANDOM % 100))
    if [ $rand -ge 0 ] && [ $rand -le 50 ]
    then
        rar=1
    elif [ $rand -gt 50 ] && [ $rand -le 80 ]
    then
        rar=2
    elif [ $rand -gt 80 ] && [ $rand -le 95 ]
    then
        rar=3
    elif [ $rand -gt 95 ] && [ $rand -le 99 ]
    then
        rar=4
    elif [ $rand -eq 100 ]
    then
        rar=5
    fi
}

enemy_rng()
{
    eid=$(($RANDOM % 12))
    if [ $eid -eq 0 ]
    then
        eid=1
    fi
}

boss_rng()
{
    bid=$(($RANDOM % 7))
    if [ $bid -eq 0 ]
    then
        bid=1
    fi
}

player_setter()
{
    firstline=0
    rar=0
    player_rng
    while IFS=',' read id name hp mp str int def res spd luck race class rarity
    do
        if [ $firstline -ne 0 ]
        then
            if [ $rar == $rarity ]
            then
                player=([name]=$name [max_hp]=$hp [hp_left]=$hp [mp]=$mp [str]=$str [int]=$int [def]=$def [res]=$res [spd]=$spd [luck]=$luck [race]=$race [class]=$class [rarity]=$rarity)
            fi
        else
            firstline=1
        fi
    done < "csv_files/players.csv"
}

enemy_setter()
{
    firstline=0
    eid=0
    bid=0
    enemy_rng
    boss_rng
    while IFS=',' read id name hp mp str int def res spd luck race class rarity
    do
        if [ $firstline -ne 0 ]
        then
            if [ $eid == $id ] || [ $bid == $id ]
            then
                enemy=([id]=$id [name]=$name [max_hp]=$hp [hp_left]=$hp [mp]=$mp [str]=$str [int]=$int [def]=$def [res]=$res [spd]=$spd [luck]=$luck [race]=$race [class]=$class [rarity]=$rarity)
            fi
        else
            firstline=1
        fi
    done < $enemy_file
}