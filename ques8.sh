#!/bin/bash
# read the country input and get the first 50  results accourdingly 
# How to run ./ques8.sh india

if [[ "${#}" -eq 0 ]]
then echo "Error :No Argument passed" exit 2
else	
result=$(curl -X GET --header "Accept: */*" "http://universities.hipolabs.com/search?country=${1}")
echo "Response from server"
echo $result | jq -r '.[] | [.country, .name] | @csv' | awk -v FS="," 'BEGIN{print "Country\tUniversity";print "============"}{printf "%s\t%s%s",$1,$2,ORS}' | head -n 50 
exit
fi
