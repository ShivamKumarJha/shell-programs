#!/usr/bin/bash -x

if [ -z "$1" ]; then
    read -p "Enter the number: " num
else
    num="$1"
fi
if [[ $num -lt 0 ]]; then
    echo "Invalid number"
    exit 1
fi

sqrt=$(awk "BEGIN {print ( $num ** 0.5 )}")
echo "Square root of $num is $sqrt"