#!/usr/bin/env bash

read -p "Enter Value of a:" a
read -p "Enter Value of b:" b
read -p "Enter Value of c:" c
d=$(awk "BEGIN {print ( ($b*$b)-4*$a*$c )}")
echo "Determinant: $d"
temp=$(awk "BEGIN {print ( -$b + ($d ** 0.5) )}")
root1=$(awk "BEGIN {print ( $temp/2*$a ) }")
temp=$(awk "BEGIN {print ( -$b - ($d ** 0.5) )}")
root2=$(awk "BEGIN {print ( $temp/2*$a ) }")
echo "Roots are: $root1 & $root2"