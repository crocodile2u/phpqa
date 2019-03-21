#!/bin/sh

files=`git-get-changed-php-files.sh -u`

if [ -z "$files" ]; then
    exit 0
fi

existing_files=""
for f in $files ; do
    if [ -f $f ]; then
        existing_files="$existing_files $f"
    fi
done

if [ -z "$existing_files" ]; then
    exit 0
fi

echo $existing_files | xargs linter.sh
if [ "$?" -ne "0" ]; then
    exit 1
fi

echo $existing_files | xargs phpcs