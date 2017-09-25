#!/bin/bash
dir=/Users/ging/Trainings/bash/Misc

show_menu() {
echo "Address Book Menu"
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
num_lines=$(cat addressBook.txt |wc -l)


while read LINE
   do
        echo "Name : $(echo ${LINE} | sed 's/ /_/g' |sed 's/:/  /g' |awk '{print
        $1}' | sed 's/_/ /g')"
          echo "Contact #:  $(echo ${LINE} | sed 's/ /_/g' |sed 's/:/  /g' |awk
          '{print $2}'| sed 's/_/ /g')"
            echo "Email Add #: $(echo ${LINE} | sed 's/ /_/g' |sed 's/:/  /g'
            |awk '{print$3}'| sed 's/_/ /g')"
              echo "Location: $(echo ${LINE} | sed 's/ /_/g' |sed 's/:/  /g'
              |awk '{print $4}'|sed 's/_/ /g')"

                if [ ${lineno} -eq ${num_lines} ]
                        then
                             break
                               fi
                                    ((lineno++))
                                      echo " "
                                       done < addressBook.txt
}

# Main
#display

while TRUE
do
show_menu
read -p "What would you like to do? " CHOICE
case "${CHOICE}" in
 1)
   read -p "Type 'A' to Display All Entries or 'B' for Custom Search." ANS1
      case "${ANS1}" in 
      A) 
       display
       ;;
      B)
       display
       ;;
      *)
       echo "Invalid Choice, going back to Main Menu"
       ;;
      esac
   ;;
 2)
   echo "Add"
   ;;
 3)
   echo "Remove"
   ;;
 4)
   echo "Update"
   ;;
 5)
   echo "Quit" 
   break
   ;;
 *)
   echo "Invalid Selection!"
   ;;
esac
done

exit 0
