#!/bin/bash

# Passing source and target directory paths as arguments

if [[ -d $1 ]]; then 
    :
    else
        printf "Please specify correct source dir path\n"
        exit 2
fi

if [[ -d $2 ]]; then
    :
    else
        printf "Please specify correct target dir path\n"
        exit 2
fi

# Executing directory sync and specifying log file including entries indicating the time, type of operation and file name

rsync -avtuh --delete --log-file=/var/log/syncdir_logfile --log-file-format="%'i %'f" $1 $2


# See 3_syncdir_logfile to check the script log output

# See 3_crontab file for implementing cron job for this script according to the task
