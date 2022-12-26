#!/bin/bash

# Script will calculate the number of times each word appears on a file.



if [[ ${#} -eq 0 ]]
then
        echo " Error: Input data not provided: -file_name"
        exit 2
fi
str=${1}
len=$( cat ${1} | awk '{t+=length($0)}END{print t}' )

if [[  ${len} -eq 0  ]]
then
        echo "${1} is an empty file."
        exit 2
elif [[ $len > 0 ]]
then
cat $1 | tr '[:upper:]' '[:lower:]' | tr " " '\n' | sort | uniq -c | sort -nr | awk -F ' ' '{print $2 " " $1}' | tr '\n' ' '
fi
