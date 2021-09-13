#!/bin/sh
set -e
sudo wget https://getcomposer.org/composer-2.phar --output-document="/usr/bin/composer2"
sudo wget https://getcomposer.org/composer-1.phar --output-document="/usr/bin/composer1"
sudo chmod +x /usr/bin/composer2 /usr/bin/composer1
sudo update-alternatives --install /usr/local/bin/composer composer /usr/bin/composer2 20
sudo update-alternatives --install /usr/local/bin/composer composer /usr/bin/composer1 10
echo "Installed composer 1 & 2"
