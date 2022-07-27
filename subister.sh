#!/bin/bash

GO_PATH="/home/amir/go/bin"

read -p "Start Asset Finder (y/n)? " status
if [ "$status" == "y" ]; then
    $GO_PATH/assetfinder --subs-only $1 | tee -a `pwd`/assetfinder.txt
fi

read -p "Start SubFinder (y/n)? " status
if [ "$status" == "y" ]; then
    echo $1 | $GO_PATH/subfinder -silent | tee -a `pwd`/subfinder.txt
fi

read -p "Start Amass (y/n)? " status
if [ "$status" == "y" ]; then
    $GO_PATH/amass enum -passive -active -d flightio.com -o `pwd`/amass.txt
fi

read -p "Start findomain (y/n)? " status
if [ "$status" == "y" ]; then
    findomain -t $1 -u findomain.txt
fi

find `pwd` -type f -name "*.txt" -exec cat {} + | sort -u | $GO_PATH/httpx -silent > `pwd`/result.txt
find `pwd` -type f -name "*.txt" -exec cat {} + | sort -u | $GO_PATH/httprobe >> `pwd`/result.txt
cat `pwd`/result.txt | sort -u | tee -a allinone.txt
rm -f result.txt

