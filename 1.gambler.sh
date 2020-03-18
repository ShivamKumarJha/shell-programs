#!/usr/bin/bash -x

if [ -z "$1" ]; then
    read -p "Enter your stake:" stake
else
    stake="$1"
fi

if [ -z "$2" ]; then
    read -p "Enter your goal:" goal
else
    goal="$2"
fi

if [[ $stake -lt 1 ]]; then
    echo "Sorry cannot start empty handed!"
    exit 1
fi

win=0
loss=0
totalgambles=0
while [[ 1 -gt 0 ]]; do
    gamble=$(shuf -i 0-1 -n 1) # random of 0,1
    totalgambles=$(( $totalgambles + 1 ))
    if [[ "$gamble" == 0 ]]; then
        [[ $stake -lt $goal ]] && stake=$(( $stake + 1 ))
        win=$(( $win + 1 ))
    else
        [[ $stake -gt 0 ]] && stake=$(( $stake - 1 ))
        loss=$(( $loss + 1 ))
    fi
    # stop conditions
    [[ $stake == 0 ]] && break
    [[ $stake == $goal ]] && break
done
echo "You won $win times."
echo "You lost $loss times."
echo "Total gambles: $totalgambles"
winp=$(awk "BEGIN {print (($win/$totalgambles)*100)}")
lossp=$(awk "BEGIN {print (100-$winp)}")
echo "Win %age: $winp"
echo "Loss %age: $lossp"
