#!/bin/sh

REPO_ROOT=`pwd`

# possible options to pre-commit.sh:
# -r : root, relative path to folder where the actual PHP files reside, i. e., "src"
# -f : fix, whether to fix code-style problems with PHPCBF, automatically

docker run -v "$REPO_ROOT:/project" -w /project crocodile2u/phpqa pre-commit.sh -f 1