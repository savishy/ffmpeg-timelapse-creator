#!/bin/bash
set -e
# first argument should be a folder
if [ ! -d "$1" ]; then 
    echo "ERROR: first argument should be a folder containing images; exiting" >&2 
    exit 1
fi

c=1
for i in $1/*.JPG; do 
    echo $c
    dir=`dirname $i`
    mv -v $i $dir/$c.JPG
    c=$((c + 1))
done
