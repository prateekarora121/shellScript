#!/bin/bash
#script to delete the files passed if the file is older than 7 days.
if [[ ${#} -eq 0 ]]
	then printf '%s\n' "Error: Input data not provided" >&2
	exit 2
elif [[ $(find "${1}" -mtime +7 -print) ]]; then
  echo "File ${1} exists and is older than 7 days"
        rm ${1}
  echo "File ${1} is deleted"
else echo "No file is older than 7 days"
fi
