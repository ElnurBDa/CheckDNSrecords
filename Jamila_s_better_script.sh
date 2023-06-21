#!/bin/bash


while read p; do
    echo "$p"
    mx=$(nslookup -type=mx "$p" | grep "mail exchanger")
    if [ -z "$mx" ]
    then
        echo " mx:-"
    else
        echo " mx:+"
    fi
    spf=$(nslookup -type=txt "$p" | grep "spf")
    if [ -z "$spf" ]
    then
        echo " spf:-"
    else
        echo " spf:+"
    fi
    dmarc=$(nslookup -type=txt "_DMARC.$p" | grep "v=DMARC")
    if [ -z "$dmarc" ]
    then
        echo " dmarc:-"
    else
        echo " dmarc:+"
    fi
done < $1

