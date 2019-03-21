# Enhanced PHPQA

Here you will find a dockerfile which extends the beautiful jakzal/phpqa and adds a nice git hook that checks the changed PHP files in your repo against php linter and PHPCS.

Usage:

```sh
wget https://raw.githubusercontent.com/crocodile2u/phpqa/master/pre-commit.host.sh
```

This will download a shell script, which has to be copied to your Git repository's `.git/hooks` folder and saved as `pre-commit` (must be executable). It's a tiny script that perfroms a call to `pre-commit.sh` from within the docker image. Change the script to add required parameters.