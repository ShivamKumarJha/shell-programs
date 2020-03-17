#!/usr/bin/env bash

declare -a sq
for ((i=1;i<=9;i++)); do
    sq[$i]=$i
done

printboard() {
    echo "---------------------"
    for ((i=1;i<=9;i++)); do
        printf "|  ${sq[$i]}  |"
        [[ $(( $i % 3 )) == 0 ]] && echo -e "\n---------------------"
    done
}

while [[ 1 -gt 0 ]]; do
    printboard
    read -p "Enter choice: " ch
    sq[$ch]="X"
    comp=$(shuf -i 1-9 -n 1)
    echo "AI: $comp"
    sq[$comp]="O"
    printboard
done