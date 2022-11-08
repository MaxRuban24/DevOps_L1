#!/bin/bash

echo "nmap tool is required to complete this task"
echo "Checking if nmap is installed..."
sleep 1

# Checking if nmap is installed

apt list --installed 2>/dev/null | grep "nmap" > .tmp


if [ -s .tmp ]; then
    echo "nmap is already installed"
    else
        echo "nmap tool is missing"
        echo "Executing nmap installation..."
        sudo apt install nmap -y
        wait
        if [ $? -eq 0 ]; then
            echo "nmap has been installed successfully"
            else
                "Something went wrong. Please try install nmap manually"
        fi
fi 

rm -f .tmp

# First function to scan active hosts on particular subnet

all ()
{
    ipv4patternsub="([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\/([1-2][0-9]|[3][0-1]))"
    echo "Please enter subnet address and prefix for scan in a format *.*.*.*/* :" ; read net
    if [[ $net =~ $ipv4patternsub ]]; then
        nmap -sn $net
        else
            echo "Wrong input. Please enter correct subnet format"
    fi
}

#Second function to scan open ports on particular system

target ()
{
    ipv4pattern="([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})"
    echo "Please enter target system IP address" ; read sysip
    if [[ $sysip =~ $ipv4pattern ]]; then
        nmap $sysip
        else 
            echo "Wrong input. Please enter correct IP address format"
    fi
}

# Executing functions according to user input

case $1 in

    --all)
        all
    ;;

    --target)
        target
    ;;

    *)
        echo -e "Script usage:\n --all to list active hosts on required subnet\n --target to list open ports on required host"
    ;;

esac