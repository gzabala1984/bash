#!/bin/bash
dir=/Users/ging/Trainings/bash/Misc
FILE='addressBook.txt'
TEMPFILE='Search.txt'
TEMPFILE2='Delete.txt'

show_menu() {
echo "*** Address Book Menu ***"
echo "1. Search / List"
echo "2. Add Entry"
echo "3. Remove Entry"
echo "4. Update Entry"
echo "5. Quit"
}

display() {
dir=/Users/ging/Trainings/bash/Misc
cd /Users/ging/Trainings/bash/Misc

lineno=1
num_lines=$(cat ${1} |wc -l)

while read LINE
do
  echo
  echo "Name       : $(echo ${LINE} | sed 's/ /_/g' | sed 's/:/  /g' | awk '{print $1}'| sed 's/_/ /g')"
  echo "Contact #  : $(echo ${LINE} | sed 's/ /_/g' | sed 's/:/  /g' | awk '{print $2}'| sed 's/_/ /g')"
  echo "Email Add #: $(echo ${LINE} | sed 's/ /-/g' | sed 's/:/  /g' | awk '{print $3}'| sed 's/-/ /g')"
  echo "Location   : $(echo ${LINE} | sed 's/ /_/g' | sed 's/:/  /g' | awk '{print $4}'| sed 's/_/ /g')"
  echo

  if [ ${lineno} -eq ${num_lines} ]
     then
     break
  fi
     ((lineno++))

 done < ${1}

}

# Main
#display

while TRUE
do
show_menu
read -p "What would you like to do? " CHOICE
case "${CHOICE}" in
 1)
   read -p "Type 'A' to Display All Entries or 'B' for Custom Search. " ANS1
      case "${ANS1}" in
      A)
       display ${FILE}
       ;;
      B)
       clear
       read -p "Enter Search \"Keyword\": " SEARCH
       #echo "Search: ${SEARCH}"
       #echo "FILE: ${FILE}"
       #echo "TEMPFILE: ${TEMPFILE}"
       grep -i "${SEARCH}" ${FILE} >  ${TEMPFILE}
       display ${TEMPFILE}
       if [[ $(cat "${TEMPFILE}" |wc -l) -eq 0 ]]; then
         echo "No Entry found.."
         echo
       fi
       ;;
      *)
       echo "Invalid Choice, going back to Main Menu"
       echo
       ;;
      esac
   ;;
 2)
   clear
   echo "*** Add New Entry ***"
   read -p "Name      : " NEWNAME
   read -p "Contact#  : " CONTACT
   read -p "Email add : " EMAIL
   read -p "Location  : " LOCATION

   read -p "Do you want to save this new entry (Y/N)? " SAVE
     case "${SAVE}" in
        Y|y|Yes|YES|yes)
         echo ""${NEWNAME}":"${CONTACT}":"${EMAIL}":"${LOCATION}"" >> ${FILE}
         echo "New Entry saved."
         echo
         ;;
      *)
       echo
       ;;
     esac
   ;;
 3)
   clear
   RECORD_COUNT=0
   echo "*** Remove / Delete Entry ***"
   while TRUE
   do
   read -p "Enter a \"Keyword\" to search for an entry you want to remove: " SEARCH
   grep -i "${SEARCH}" ${FILE} >  ${TEMPFILE}
   RECORD_COUNT=$(cat ${TEMPFILE} | wc -l)

   # if record_count is more than 1, then ask if user wants to delete all entries found by SEARCH
     if [[ "${RECORD_COUNT}" -gt 1 ]]; then
         echo "Multiple Entries found!  Please narrow down your SEARCH to a specific entry."
         display ${TEMPFILE}
         echo
     elif [[ "${RECORD_COUNT}" -eq 0 ]]; then
         echo "No entries found!  Please retry searching."
     else
         display ${TEMPFILE}
         read -p "Do you want to delete the above entry? (Y/N) " DELETE
         case "${DELETE}" in
             Y|y|Yes|YES|yes)
               grep -iv "${SEARCH}" ${FILE} >  ${TEMPFILE2}
               mv ${TEMPFILE2}  ${FILE}
               echo "Entry deleted."
               echo
               break
               ;;
            N|n|No|NO|no)
               break
               ;;
                       *)
               echo "Invalid response."
               echo
               ;;
          esac
      fi
    done
   ;;
 4)
   echo "Update"
   ;;
 5)
   echo "Quit"
   rm ${TEMPFILE}
   break
   ;;
 *)
   echo "Invalid Selection!"
   ;;
esac
done

exit 0
