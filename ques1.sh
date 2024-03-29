#!/bin/bash

reverse_words_and_order(){
    if [[ ${#} -eq 0 ]]
	then printf '%s\n' "Error: Input data not provided" >&2
	exit 2 
    else
	local result=
	local reverse=
      for word in ${@};
      do
	    reverse=$(expr $word| rev)
	#echo $reverse
        result="$result $reverse"
      done

      result=${result## }
      result=$(echo $result | tr '[:upper:]' '[:lower:]')
      echo ${result^}
   fi
}
reverse_words_and_order ${1}
