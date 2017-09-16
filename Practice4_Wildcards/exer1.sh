#!/bin/bash

NOW=$(date +"%Y-%m-%d")

# suppress error msg when there are no *.jpg in the directory
shopt -s nullglob

JPG=$(ls *.jpg)

#for OLD in $JPG
for OLD in *.jpg
do 
    echo "Renaming ${OLD} to ${NOW}-${OLD}"
    mv ${OLD} ${NOW}-${OLD}
    echo "File renamed"
    echo ""
done
exit 0
