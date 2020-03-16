#!/usr/bin/env bash

if [ -z "$1" ] ; then
    read -p "Enter power: " power
else
    power="$1"
fi

value=1
for ((i=1;i<=${power};i++)); do
    value=$((value*2))
    echo "2 * ${i} = ${value}"
done