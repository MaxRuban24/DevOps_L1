# !/bin/bash

logfile=./example_log.log

cat $logfile | awk '/[B|b][O|o][T|t]/{print $1,$12,$13,$14,$15,$16,$17}'  | sed 's/\(\"Mozilla\/5\.0\|(compatible\;\|Linux x86\_64\)//g' | \

sed -n '/[B|b][O|o][T|t]/p' | uniq -c | sort -nr