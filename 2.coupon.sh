#!/usr/bin/bash -x

if [ -z "$1" ]; then
    read -p "Enter the number of coupons: " num
else
    num="$1"
fi

rm -rf coupons.txt
count=0
distinct=0
while [[ $distinct -lt $num ]]; do
    randnum=$((1 + RANDOM % $num))
    value=$(awk "BEGIN {print ($randnum*($num-1))}")
    echo "Random Number Generated: $value"
    count=$(( $count + 1 ))
    if cat coupons.txt |  grep "^$value"; then
        echo "Old value. Skipping."
    else
        echo "New value. Writing..."
        echo $value >> coupons.txt
        distinct=$(( $distinct + 1 ))
    fi
done

# sort coupons list
sort -n -o coupons.txt coupons.txt

# display coupons generated
echo "$count coupons generated."
echo "$distinct distinct coupons generated."
echo "Generated coupons:"
cat coupons.txt
