#!/bin/sh

files="$1"

# If $files variable is empty, exit immediately
if [ -z "$files" ]; then
    exit 0
fi

# Loop through changed PHP files and run php -l on each
for f in $files ; do
    php -l $f
    if [ "$?" -ne "0" ]; then
        exit 1
    fi
done

exit 0
