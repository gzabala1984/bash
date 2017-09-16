#!/bin/bash

NOW=$(date +"%Y-%m-%d")

# suppress error msg when there are no *.jpg in the directory
shopt -s nullglob

JPG=$(ls *.jpg)


# get user input
read -p "Please enter a file extension: " EXT
read -p "Please enter a file prefix: (Press ENTER for ${NOW}) " PREF

if [ -z $PREF ]
then
   PREF="${NOW}"
# echo "PREF:"${PREF}
fi


for OLD in *.${EXT}
do 
    echo "Renaming ${OLD} to ${PREF}-${OLD}."
    mv ${OLD} ${PREF}-${OLD}
    echo "File renamed"
    echo ""
done
exit 0
