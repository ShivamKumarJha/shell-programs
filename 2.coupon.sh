#!/usr/bin/bash -x

if [ -z "$1" ]; then
    read -p "Enter the number of coupons: " num
else
    num="$1"
fi

array=()
count=0
distinct=0
while [[ $distinct -lt $num ]]; do
    randnum=$((1 + RANDOM % $num))
    value=$(awk "BEGIN {print ($randnum*($num-1))}")
    echo "Random Number Generated: $value"
    count=$(( $count + 1 ))
    if [[ " ${array[@]} " =~ " ${value} " ]]; then
        echo "Old value. Skipping."
    else
        echo "New value. Adding..."
        array+=($value)
        distinct=$(( $distinct + 1 ))
    fi
done

# display coupons generated
echo "$count coupons generated."
echo "$distinct distinct coupons generated."
echo "Generated coupons:"
echo ${array[@]}
