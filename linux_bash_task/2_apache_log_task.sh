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

            3) cat $logfile | awk '{ print $1 }' | uniq -c | sort -nr | awk '{ print $1 " " "requests" " " "from:" " " $2 }'
                ;;

            4) printf "Non-existent pages referred by clients: %s\n\n"

            cat $logfile | awk '{ print $9,$7 }' | grep "404" | awk '{ print $2 }' | tee file

            printf "%s\nTotal: $(cat file | wc -l) files %s\n"

            rm -f file
                ;;

            5) requests () {

                    printf "between 8:00 and 9:00:\t"
                    
                    cat $logfile | awk '{print $4}' | sed 's/\[//g' | sed -n '/25\/Apr\/2017\:08./ p' | printf "`wc -l` requests\n"

                    printf "between 9:00 and 10:00\t"

                    cat $logfile | awk '{print $4}' | sed 's/\[//g' | sed -n '/25\/Apr\/2017\:09./ p' | printf "`wc -l` requests\n"

                    printf "between 10:00 and 11:00\t"

                    cat $logfile | awk '{print $4}' | sed 's/\[//g' | sed -n '/25\/Apr\/2017\:10./ p' | printf "`wc -l` requests\n"

                    printf "between 11:00 and 12:00\t"

                    cat $logfile | awk '{print $4}' | sed 's/\[//g' | sed -n '/25\/Apr\/2017\:11./ p' | printf "`wc -l` requests\n"

                    printf "between 12:00 and 13:00\t"

                    cat $logfile | awk '{print $4}' | sed 's/\[//g' | sed -n '/25\/Apr\/2017\:12./ p' | printf "`wc -l` requests\n"

                    printf "between 13:00 and 14:00\t"

                    cat $logfile | awk '{print $4}' | sed 's/\[//g' | sed -n '/25\/Apr\/2017\:13./ p' | printf "`wc -l` requests\n"

                }
                topreq=$(requests | awk '{print $5}' | sort -nr | sed -n '1 p')

                requests | sed -n "/$topreq/p" | sed -n 's/^/Site got most requests /p' | sed -n 's/and [0-9][0-9]\:00/&\-/p'
                ;; 


        esac




else
    echo "Path is not valid. Please enter correct logfile path"
fi


