#!/bin/bash

LN=1
while read LINE
do
    echo "${LN} : ${LINE}"
    ((LN++))
done < /etc/passwd
