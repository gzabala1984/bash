#!/bin/bash

file_count() {
# This function counts the number of files in the present working directory

CNT=$(ls -lrt $1 |wc -l)
echo "File count on directory \"${1}\":"
echo "${CNT}"
}

if [ -d $1 ] 
then
  file_count $1
else
  echo "Not a directory!"
  exit 1
fi
