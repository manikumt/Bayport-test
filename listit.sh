#!/bin/bash
find . -maxdepth 1 -type d > directories.list 
sed -i "1iline one's line" directories.list
head -3 directories.list
echo -e "\nLoop Output:\n"
count=1
if [ $1 -gt 0 ]; then
 while [ $count -le $1 ]
 do
    ((count++))
    head -3 directories.list
 done 
fi



