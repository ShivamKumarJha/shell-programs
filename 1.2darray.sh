#!/usr/bin/env bash

read -p "Enter no. of rows: " rows
read -p "Enter no. of columns: " cols

declare -A array

for ((i=1;i<=${rows};i++)); do
    for ((j=1;j<=${cols};j++)); do
        read -p "Enter element " value
        array[$i,$j]=$value
    done
done

for ((i=1;i<=${rows};i++)); do
    for ((j=1;j<=${cols};j++)); do
        printf "${array[$i,$j]}    "
    done
    echo ""
done