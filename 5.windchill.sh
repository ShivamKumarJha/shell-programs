#!/usr/bin/bash -x

read -p "Enter the Temperature from 0 to 50: " temperature

if [[ $temperature -ge 0 ]] && [[ $temperature -le 50 ]]; then
    read -p "Enter the Wind Speed between 3 to 120: " windSpeed
    if [[ $windSpeed -ge 3 ]] && [[ $windSpeed -le 120 ]]; then
        awk "BEGIN {print (35.74 + 0.6215 * $temperature + (0.4275 * $temperature - 35.75) * ($windSpeed ** 0.16)  )}"
    else
        echo "Invalid Wind Speed."
    fi
else
    echo "Invalid Temperature."
fi