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
    # win conditions for computer
    if [[ ${sq[1]} == "O" ]] && [[ ${sq[2]} == "O" ]] & [[ ${sq[3]} == "O" ]]; then
        echo "Compter wins!"
        break
    fi
    if [[ ${sq[4]} == "O" ]] && [[ ${sq[5]} == "O" ]] & [[ ${sq[6]} == "O" ]]; then
        echo "Compter wins!"
        break
    fi
    if [[ ${sq[7]} == "O" ]] && [[ ${sq[8]} == "O" ]] & [[ ${sq[9]} == "O" ]]; then
        echo "Compter wins!"
        break
    fi
    if [[ ${sq[1]} == "O" ]] && [[ ${sq[5]} == "O" ]] & [[ ${sq[9]} == "O" ]]; then
        echo "Computer wins!"
        break
    fi
    if [[ ${sq[3]} == "O" ]] && [[ ${sq[5]} == "O" ]] & [[ ${sq[7]} == "O" ]]; then
        echo "Computer wins!"
        break
    fi
    # win conditions for user
    if [[ ${sq[1]} == "X" ]] && [[ ${sq[2]} == "X" ]] & [[ ${sq[3]} == "X" ]]; then
        echo "User wins!"
        break
    fi
    if [[ ${sq[4]} == "X" ]] && [[ ${sq[5]} == "X" ]] & [[ ${sq[6]} == "X" ]]; then
        echo "User wins!"
        break
    fi
    if [[ ${sq[7]} == "X" ]] && [[ ${sq[8]} == "X" ]] & [[ ${sq[9]} == "X" ]]; then
        echo "User wins!"
        break
    fi
    if [[ ${sq[1]} == "X" ]] && [[ ${sq[5]} == "X" ]] & [[ ${sq[9]} == "X" ]]; then
        echo "User wins!"
        break
    fi
    if [[ ${sq[3]} == "X" ]] && [[ ${sq[5]} == "X" ]] & [[ ${sq[7]} == "X" ]]; then
        echo "User wins!"
        break
    fi
done
