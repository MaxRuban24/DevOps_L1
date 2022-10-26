# !/bin/bash

file=./example_log.log

cat $file | awk '{ print $7 }' | uniq -c | sort -nr | head -5