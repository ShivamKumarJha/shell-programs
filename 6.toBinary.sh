#!/usr/bin/bash -x

if [ -z "$1" ]; then
    read -p "Enter the number: " num
else
    num="$1"
fi

echo "obase=2;$num" | bc
