#!/bin/sh
set -e
#wget https://starship.rs/install.sh -O- | sh --yes
sh -c "$(curl -fsSL https://starship.rs/install.sh) --force"
echo "Installed Starship prompt."
