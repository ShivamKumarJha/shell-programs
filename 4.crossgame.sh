#!/usr/bin/env bash

declare -a sq
index=0
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
    # user i/p
    read -p "Enter choice: " ch
    index=$ch
    if [[ ${sq[$index]} != "X" ]]; then
        sq[$index]="X"
    else
        echo "Already has data. Repeating"
    fi
    # computer choice
    comp=$(shuf -i 1-9 -n 1)
    index=$comp
    if [[ ${sq[$index]} != "O" ]]; then
        sq[$index]="O"
    else
        echo "Already has data. Repeating"
    fi
    printboard
done