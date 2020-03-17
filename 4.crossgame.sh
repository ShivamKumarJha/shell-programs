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
    if [[ ${sq[$index]} != "X" ]] && [[ ${sq[$index]} != "O" ]]; then
        sq[$index]="X"
    else
        echo "Already has data. Repeating"
        continue
    fi
    # computer choice
    comp=$(shuf -i 1-9 -n 1)
    index=$comp
    if [[ ${sq[$index]} != "X" ]] && [[ ${sq[$index]} != "O" ]]; then
        sq[$index]="O"
    else
        echo "Already has data. Repeating"
        continue
    fi
    printboard
    # win conditions
    wr1="${sq[1]} ${sq[2]} ${sq[3]}"
    wr2="${sq[4]} ${sq[5]} ${sq[6]}"
    wr3="${sq[7]} ${sq[8]} ${sq[9]}"
    wc1="${sq[1]} ${sq[4]} ${sq[7]}"
    wc2="${sq[2]} ${sq[5]} ${sq[8]}"
    wc3="${sq[3]} ${sq[6]} ${sq[9]}"
    wd1="${sq[1]} ${sq[5]} ${sq[9]}"
    wd2="${sq[3]} ${sq[5]} ${sq[7]}"
    winx="X X X"
    wino="O O O"
    if [ "$wr1" = "$winx" -o "$wr2" = "$winx" -o "$wr3" = "$winx" -o "$wc1" = "$winx" -o "$wc2" = "$winx" -o "$wc3" = "$winx" -o "$wd1" = "$winx" -o "$wd2" = "$winx" ]; then
        echo "User wins!"
        break
    fi
    if [ "$wr1" = "$wino" -o "$wr2" = "$wino" -o "$wr3" = "$wino" -o "$wc1" = "$wino" -o "$wc2" = "$wino" -o "$wc3" = "$wino" -o "$wd1" = "$wino" -o "$wd2" = "$wino" ]; then
        echo "Computer wins!"
        break
    fi
done
