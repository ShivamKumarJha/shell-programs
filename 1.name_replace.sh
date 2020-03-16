#!/usr/bin/env bash

if [ -z "$1" ] ; then
    read -p "Enter user name: " user_name
else
    user_name="$1"
fi

stringtemplate='"Hello <<UserName>>, How are you?"'
echo ${stringtemplate}

echo $( echo ${stringtemplate} | sed "s|<<UserName>>|${user_name}|1" )
