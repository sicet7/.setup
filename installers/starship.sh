#!/bin/sh
set -e
#wget https://starship.rs/install.sh -O- | sh --yes
sh -c "$(curl -fsSL https://starship.rs/install.sh)" "install.sh" --yes
echo "Installed Starship prompt."
