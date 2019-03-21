#!/bin/sh

REPO_ROOT=`pwd`

docker run -v "$REPO_ROOT:/project" -w /project crocodile2u/phpqa pre-commit.sh