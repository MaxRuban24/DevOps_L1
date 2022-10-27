# !/bin/bash

file=./example_log.log

requests () {
    printf "between 8:00 and 9:00:\t"
    
    cat $file | awk '{print $4}' | sed 's/\[//g' | sed -n '/25\/Apr\/2017\:08./ p' | printf "`wc -l` requests\n"

    printf "between 9:00 and 10:00\t"

    cat $file | awk '{print $4}' | sed 's/\[//g' | sed -n '/25\/Apr\/2017\:09./ p' | printf "`wc -l` requests\n"

    printf "between 10:00 and 11:00\t"

    cat $file | awk '{print $4}' | sed 's/\[//g' | sed -n '/25\/Apr\/2017\:10./ p' | printf "`wc -l` requests\n"

    printf "between 11:00 and 12:00\t"

    cat $file | awk '{print $4}' | sed 's/\[//g' | sed -n '/25\/Apr\/2017\:11./ p' | printf "`wc -l` requests\n"

    printf "between 12:00 and 13:00\t"

    cat $file | awk '{print $4}' | sed 's/\[//g' | sed -n '/25\/Apr\/2017\:12./ p' | printf "`wc -l` requests\n"

    printf "between 13:00 and 14:00\t"

    cat $file | awk '{print $4}' | sed 's/\[//g' | sed -n '/25\/Apr\/2017\:13./ p' | printf "`wc -l` requests\n"

}
topreq=$(requests | awk '{print $5}' | sort -nr | sed -n '1 p')

requests | sed -n "/$topreq/p" | sed -n 's/^/Site got most requests /p' | sed -n 's/and [0-9][0-9]\:00/&\-/p'