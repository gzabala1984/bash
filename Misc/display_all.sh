#!/bin/bash

dir=/Users/ging/Trainings/bash/Misc
cd /Users/ging/Trainings/bash/Misc

lineno=1
num_lines=$(cat addressBook.txt |wc -l)


while read LINE
do
  echo "Name : $(echo ${LINE} | sed 's/ /_/g' |sed 's/:/  /g' |awk '{print $1}' | sed 's/_/ /g')"
  echo "Contact #:  $(echo ${LINE} | sed 's/ /_/g' |sed 's/:/  /g' |awk '{print $2}'| sed 's/_/ /g')"
  echo "Email Add #: $(echo ${LINE} | sed 's/ /_/g' |sed 's/:/  /g' |awk '{print$3}'| sed 's/_/ /g')"
  echo "Location: $(echo ${LINE} | sed 's/ /_/g' |sed 's/:/  /g' |awk '{print $4}'|sed 's/_/ /g')"

  if [ ${lineno} -eq ${num_lines} ]
     then
     break
  fi
     ((lineno++))
  echo " "
 done < addressBook.txt


