#!/usr/bin/env bash

if [ -z "$1" ] ; then
    read -p "Enter year: " yearvar
else
    yearvar="$1"
fi

if [[ $( echo ${yearvar} | wc -m ) == 5 ]]; then
    echo "Proceeding..."
    if [[ $(( ${yearvar} % 400 )) == 0 ]]; then
        echo "${yearvar} is a Leap Year"
    elif [[ $(( ${yearvar} % 4 )) == 0 ]] && [[ $(( ${yearvar} % 100 )) != 0 ]]; then
        echo "${yearvar} is a Leap Year"
    else
        echo "${yearvar} is NOT a Leap Year"
    fi
else
    echo "Invalid year."
fi
