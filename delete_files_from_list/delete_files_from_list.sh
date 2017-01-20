#!/bin/bash
echo "This script will delete files mentioned in files.txt"
old_IFS=$IFS      # save the field separator           
IFS=$'\n'     # new field separator, the end of line           
for line in $(cat /scripts/files.txt)          
do          
   echo "DO you want to delete file $line"
read -r -p "Are you sure? [y/N] " response
case $response in
    [yY]*)
	rm $line; 
        echo "deleted file"
        ;;
    *)
        echo "not deleted"
        ;;
esac;
done          
IFS=$old_IFS     # restore default field separator
