#!/usr/bin/env bash

stringtemplate='"Hello <<UserName>>, How are you?"'
echo ${stringtemplate}
read -p "Enter user name: " user_name
echo $( echo ${stringtemplate} | sed "s|<<UserName>>|${user_name}|1" )