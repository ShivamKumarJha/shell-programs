#!/usr/bin/bash -x

if [ -z "$1" ] ; then
    read -p "Enter year: " year
else
    year="$1"
fi

if [[ $( echo ${year} | wc -m ) == 5 ]]; then
    echo "Proceeding..."
    if [[ $(( ${year} % 400 )) == 0 ]]; then
        echo "${year} is a Leap Year"
    elif [[ $(( ${year} % 4 )) == 0 ]] && [[ $(( ${year} % 100 )) != 0 ]]; then
        echo "${year} is a Leap Year"
    else
        echo "${year} is NOT a Leap Year"
    fi
else
    echo "Invalid year."
fi
