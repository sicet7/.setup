#!/bin/sh
set -e
sh -c "$(curl -fsSL https://starship.rs/install.sh)" "install.sh" --yes
echo "Installed Starship prompt."
