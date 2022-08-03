#!/bin/bash

GO_PATH="$HOME/go/bin"
args=$@

function findDomain() {
    if [ "$2" == "y" ]; then
        $GO_PATH/assetfinder --subs-only $1 | tee -a `pwd`/assetfinder.txt
    fi

    if [ "$3" == "y" ]; then
        echo $1 | $GO_PATH/subfinder -silent | tee -a `pwd`/subfinder.txt
    fi

    if [ "$4" == "y" ]; then
        $GO_PATH/amass enum -passive -active -d $1 -o `pwd`/amass.txt
    fi

    if [ "$5" == "y" ]; then
        findomain -t $1 -u findomain.txt
    fi

    find `pwd` -type f -name "*.txt" -exec cat {} + | sort -u | $GO_PATH/httpx -silent > `pwd`/result.txt
    find `pwd` -type f -name "*.txt" -exec cat {} + | sort -u | $GO_PATH/httprobe >> `pwd`/result.txt
    cat `pwd`/result.txt | sort -u | tee -a allinone.txt
    rm -f result.txt
}

function askTools() {
    read -p "Use Asset Finder (y/n)? " af
    read -p "Use SubFinder (y/n)? " sf
    read -p "Use Amass (y/n)? " am
    read -p "Use Findomain (y/n)? " fin
    for arg in $args
    do
        echo "Start Search for $arg"
        findDomain $arg $af $sf $am $fin
    done
}

if ! command -v go version &> /dev/null
then
    echo "Go is not installed"
    exit
else
    askTools
fi
