#!/bin/sh

installIfMissing "wget" "wget"

#Download Composer
COMPOSER_FILE="$SP/src/composer.phar"
if [ ! -d $(dirname "$COMPOSER_FILE") ]; then
    mkdir -p $(dirname "$COMPOSER_FILE")
fi
if [ -f "$COMPOSER_FILE" ]; then
    rm -vf "$COMPOSER_FILE"
fi
wget https://getcomposer.org/composer-stable.phar --output-document="$COMPOSER_FILE"

#Composer
linkDotFile "$COMPOSER_FILE" "$HOME/.local/bin/composer"
