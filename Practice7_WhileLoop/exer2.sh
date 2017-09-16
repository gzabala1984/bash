#!/bin/bash

read -p "How many lines of /etc/passwd would like to see? " X

LN=1
while read LINE
do
  echo "${LN} : ${LINE}"

  if [ $X -eq $LN ]
  then
   break
  fi

  ((LN++))

done < /etc/passwd
