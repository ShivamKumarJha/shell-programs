#!/usr/bin/bash -x

while [[ 1 -gt 0 ]]; do
    printf "\n1. Celsius to Fahrenheit\n2. Fahrenheit to Celsius\n"
    read -p "Choice: " choice
    if [[ $choice == 1 ]]; then
        read -p "Enter value in Celsius: " value
        conv=$(awk "BEGIN {print ( ($value*9/5)+32 )}")
        echo "Fahrenheit: $conv"
        break
    elif [[ $choice == 2 ]]; then
        read -p "Enter value in Fahrenheit: " value
        conv=$(awk "BEGIN {print ( ($value-32)*5/9 )}")
        echo "Celsius: $conv"
        break
    else
        echo "Wrong choice!"
    fi
done