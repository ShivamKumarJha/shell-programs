#!/usr/bin/env bash

read -p "Enter the number: " num
echo "obase=2;$num" | bc
