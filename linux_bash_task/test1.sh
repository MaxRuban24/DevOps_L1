# !/bin/bash

ipv4pattern="([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\/([1-2][0-9]|[3][0-1]))"
    echo "Please enter subnet address and prefix for scan in a format *.*.*.*/* :" ; read net
    if [[ $net =~ $ipv4pattern ]]; then
        nmap -sn $net
        else
            echo "Wrong input. Please enter correct subnet format"
    fi

