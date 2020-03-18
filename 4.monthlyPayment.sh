#!/usr/bin/bash -x

if [ -z "$3" ]; then
    echo "Enter 3 args as <P> <Y> <R>"
    exit 1
fi

p="$1"
y="$2"
r="$3"

n=$((12*$y))
r2=$(awk "BEGIN {print ( $r/(12*100) )}")
payment=$(awk "BEGIN {print ( $p*$r2/(1-(1+$r2)**(-$n)) )}")
echo $payment