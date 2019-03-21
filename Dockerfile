FROM jakzal/phpqa:alpine

COPY git-get-changed-php-files.sh /usr/bin/
COPY linter.sh /usr/bin/
COPY pre-commit.sh /usr/bin/
RUN chmod +x /usr/bin/*