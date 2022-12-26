#!/bin/bash

#Code will scan through the passed file and  if there are any matches for the current or next day will be shown in table format

if [[ ${#} -eq 0 ]]
then
        echo "Use the script like this: ${0} -file_name"
        exit 2
fi

for i in $( grep -A1 -i --no-group-separator 'Today\|Tomorrow'  ${1} ) 
     do	
	if [[ $i == 'Today' || $i == 'Tomorrow' ]]  
	then	
        FILE="$FILE $LINE"
	LINE="\n$i : "
        else 
         LINE=$"$LINE $i"		
	 fi
	 #FILE="$FILE $LINE "
     done
     FILE="$FILE $LINE "
echo -e $FILE | sort -k1 | column -t -s:
#$FILE
