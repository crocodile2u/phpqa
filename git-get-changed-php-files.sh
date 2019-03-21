#!/bin/sh

# Initialize our own variables:
branch="master"
cached=""

while getopts "ucb:" opt; do
    case "$opt" in
    u)
        branch=""
        cached="--cached"
        break
        ;;
    c)
        cached="--cached"
        ;;
    b)  branch=$OPTARG
        ;;
    esac
done


cmd="git diff --name-status --relative $branch $cached"
eval $cmd | grep '\.php$' | grep -v "^[RD]" | awk '{ print $2 }'