#!/bin/bash

# Checking logfile path
echo "Please enter logfile path"; read logfile
if [ -e $logfile ]; then

    echo "Please choose the option: "
    echo "----------------------------------"
    echo "1. From which ip were the most requests?"
    echo "2. What is the most requested page?"
    echo "3. How many requests were there from each ip?"
    echo "4. What non-existent pages were clients referred to?"
    echo "5. What time did site get the most requests?"
    echo "6. What search bots have accessed the site? (UA + IP)"
    echo " "
    read -p "Type [1-6] : " option

        case $option in

        1) cat $logfile | awk '{ print $1 }' | uniq -c | sort -nr | head -5
           ;; 
        
        2) cat $logfile | awk '{ print $7 }' | uniq -c | sort -nr | head -3
            ;;

        3) cat $logfile | awk '{ print $1 }' | uniq -c | sort -nr

        esac











else
    echo "Path is not valid. Please enter correct logfile path"
fi


