#!/usr/bin/bash -x

read -p "Enter Value of x:" x
read -p "Enter Value of y:" y
awk "BEGIN {print ( $x ** 2 + $y ** 2 )}"