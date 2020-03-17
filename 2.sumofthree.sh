#!/usr/bin/env bash

read -p "Enter size: " size

if [[ $size -lt 3 ]]; then
    echo "Size must be greater than or equal to 3"
    exit 1
fi

declare -A array

for ((i=1;i<=${size};i++)); do
    read -p "Enter element " value
    array[$i]=$value
done

for ((i=1;i<=${size};i++)); do
    for ((j=$(($i+1));j<=${size};j++)); do
        for ((k=$(($j+1));k<=${size};k++)); do
            if [[ $(( array[$i] + array[$j] + array[$k] )) == 0 ]]; then
                echo "$array[$i] + $array[$j] + $array[$k] = 0"
            fi
        done
    done
done
