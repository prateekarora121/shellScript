#!/bin/bash

for i in $( grep -A1 -i --no-group-separator 'Today\|Tomorrow'  agenda.txt ) 
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
echo -e $FILE | sort -k1
#$FILE
