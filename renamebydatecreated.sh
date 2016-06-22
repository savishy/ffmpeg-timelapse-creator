#!/bin/bash
set -e
# rename images in source folder according to date taken.
# http://www.linuxjournal.com/content/tech-tip-automaticaly-organize-your-photos-date

# requires imagemagick
command -v identify >/dev/null 2>&1 || { echo "ERROR: I require identify from imagemagick but it's not installed.  Aborting." >&2; exit 1; }

# first argument should be a folder
if [ ! -d "$1" ]; then 
    echo "ERROR: first argument should be a folder containing images; exiting" >&2 
    exit 1
fi

for fil in $1/*.JPG  # Also try *.JPG
do
    datepath=$(identify -verbose $fil | grep DateTimeOri | awk '{print $2_$3 }' | sed s%:%%g)
    dir=`dirname $fil`
    mv -v $fil $dir/$datepath.JPG
done
