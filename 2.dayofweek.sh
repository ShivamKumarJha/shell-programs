#!/usr/bin/env bash

if [ -z "$3" ]; then
    echo "Enter 3 args as <month> <date> <year>!"
    exit 1
fi

m="$1"
d="$2"
y="$3"
y0=$(awk "BEGIN {print ( $y - (14-$m)/12 )}")
x=$(awk "BEGIN {print ( $y0 + $y0/4 - $y0/100 + $y0/400 )}")
m0=$(awk "BEGIN {print ( $m + 12 *((14-$m)/12)-2 )}")
d0=$(awk "BEGIN {print ( ($d + $x + 31*$m0/12)%7 )}")
day="$( echo $d0 | sed "s|\..*||1" )" # make d0 int
if [[ $day == 0 ]]; then
    echo "Sunday"
elif [[ $day == 1 ]]; then
    echo "Monday"
elif [[ $day == 2 ]]; then
    echo "Tuesday"
elif [[ $day == 3 ]]; then
    echo "Wednesday"
elif [[ $day == 4 ]]; then
    echo "Thursday"
elif [[ $day == 5 ]]; then
    echo "Friday"
elif [[ $day == 6 ]]; then
    echo "Saturday"
fi
