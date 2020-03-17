#!/usr/bin/env bash

declare -a sq
for ((i=1;i<=9;i++)); do
    sq[$i]=$i
done

printboard() {
    for ((i=1;i<=9;i++)); do
        printf "${sq[$i]}    "
        [[ $(( $i % 3 )) == 0 ]] && echo ""
    done
}
printboard
