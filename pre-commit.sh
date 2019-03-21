#!/bin/sh

fixes_with_phpcbf=0

while getopts "r:" opt; do
    case "$opt" in
    "r")  echo "All paths relative to $OPTARG"
        cd $OPTARG
        ;;
    "f")  fixes_with_phpcbf=$OPTARG
        ;;
    esac
done

files=`git-get-changed-php-files.sh -u`

if [ -z "$files" ]; then
    exit 0
fi

existing_files=""
for f in $files ; do
    if [ -f $f ]; then
        php -l $f
        existing_files="$existing_files $f"
    fi
done

if [ -z "$existing_files" ]; then
    exit 0
fi

#echo $existing_files | xargs linter.sh

echo $existing_files | xargs phpcs
if [ "$?" -ne "0" ]; then
    if [ "$fixes_with_phpcbf" -eq "0" ]; then
        echo "Applying automatic formatting fixes with PHPCBF..."
        echo $existing_files | xargs phpcbf
    fi
    exit 1
fi