#!/usr/bin/env bash

read -p "Start? " starttime
SECONDS=0
read -p "End? " endtime
duration=$SECONDS
echo -e "Duration: $(($duration / 60)) minutes and $(($duration % 60)) seconds."
