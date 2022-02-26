#!/bin/sh
set -e
#curl -fsSL https://starship.rs/install.sh | bash -s -- --yes
sh -c "$(curl -fsSL https://starship.rs/install.sh) --yes"
echo "Installed Starship prompt."
