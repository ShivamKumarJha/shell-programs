#!/usr/bin/env bash

heads=0
tails=0
read -p "Number of times to Flip the Coin?" n
if [[ n -gt 0 ]]; then
    for ((i=1;i<=${n};i++)); do
        COIN=$(shuf -i 0-1 -n 1)
        if [[ ${COIN} == 0 ]]; then
            heads=$((heads+1))
        elif [[ ${COIN} == 1 ]]; then
            tails=$((tails+1))
        fi
    done
    echo "Heads count: ${heads}"
    echo "Tails count: ${tails}"
    headpercent=$(( ${heads}*100/${n} ))
    tailpercent=$(( 100-${headpercent} ))
    echo "Heads %: ${headpercent}"
    echo "Tails %: ${tailpercent}"
else
    echo "Invalid value"
fi