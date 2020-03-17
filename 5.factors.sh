#!/usr/bin/env bash

if [ -z "$1" ] ; then
    read -p "Enter an integer: " n
else
    n="$1"
fi

echo " Prime Factors are Listed below: "
i=1
while [[ $(( $i * $i )) -le $n ]]; do
    k=0
    if [[ $(( $n % $i )) == 0 ]]; then
        j=1
        while [[ $j -le $i ]]; do
            if [[ $(( $i % $j )) == 0 ]]; then
                k=$(( $k + 1 ))
            fi
            j=$(( $j + 1 ))
        done
        if [[ $k == 2 ]]; then
            echo $i
        fi
    fi
    i=$(( $i + 1 ))
done