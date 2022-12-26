#!/bin/bash

#shell script takes 2 arguments, one is password or blank value. Second is Named Argument.
#Print encrypted form of that password using 5 different types of algorithms which is selected randomly. 
#For Named arguments, get the result according to named argument passed in argument.
# --algo means get algorithm name
# --text returns the passed password
# --length means length of encrypted password

PASSWD=
NAME=
TEXT=
encrypt()
{
opt="${*}"
           case $opt in
                  --algo)
                      DETAIL="Algo name: $NAME";;
                  --len) 
		      if [[ "${#TEXT}" -ne 0 ]]
		      then DETAIL="Length of password : ${#PASSWD}"
	              else echo "Password not passed" 
			   exit 2
		      fi;;
                  --text) 
		      if [[ "${#TEXT}" -ne 0 ]]
		      then DETAIL="Password Text : $TEXT"
		      else echo "Password not passed"
			   exit 2
		      fi;;
		   *) echo "Invalid argument passed: ${*} "
      esac

echo -e $DETAIL
}

get_passwd()
{

num=$(( ( RANDOM % 5 )  + 1 ))

if [[ "${#}" -eq 1 ]]
then text=${1} 
     TEXT=${text}
else text="num"      	
     
fi


case $num in
                     1)	     
                     PASSWD=$(echo "$text" | sha256sum )
                     NAME='sha256' ;;
		     2)
                     PASSWD=$(echo "$text" | sha1sum )
                     NAME='sha1' ;;
		     3)
                     PASSWD=$(echo "$text" | sha384sum )
                     NAME='sha384' ;;
		     4)
                     PASSWD=$(echo "$text" | md5sum )
                     NAME='md5' ;;
		     *)
                     PASSWD=$(echo "$text" | shasum )
                     NAME='sha' ;;
                 
esac

echo "Encrypted password: $PASSWD"

}

if [[ "${#}" -eq 1 ]]
then get_passwd
     encrypt ${1}

elif [[ "${#}" -eq 0 ]]
then echo "Error :No Argument passed" 
     exit 2

elif [[ "${#}" -eq 2 ]]
then get_passwd ${1}
     encrypt ${2} 
else echo "Error :Invalid Input" 
     exit 2
fi

