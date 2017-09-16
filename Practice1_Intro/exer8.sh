#!/bin/bash

for FILE in $@
do
echo "Checking ${FILE}"

if [ -f ${FILE} ] 
then
  echo "${FILE} is a regular file."
  ls -l ${FILE}
elif [ -d ${FILE} ]
then
  echo "${FILE} is a directory."
  ls -l ${FILE}
else
  echo "${FILE} is not a regular file nor a directory."
fi

echo ""
echo ""

done
