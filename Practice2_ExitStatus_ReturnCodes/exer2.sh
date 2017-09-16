#!/bin/bash

for FILE in $@
do
echo "Checking ${FILE}"

if [ -f ${FILE} ] 
then
  echo "${FILE} is a regular file."
  exit 0
elif [ -d ${FILE} ]
then
  echo "${FILE} is a directory."
  exit 1
else
  echo "${FILE} is not a regular file nor a directory."
  exit 2
fi

echo ""
echo ""

done
