#!/bin/sh
set -e
curl -fsSL https://starship.rs/install.sh | sh --yes
#sh -c "$(curl -fsSL https://starship.rs/install.sh)" --yes
echo "Installed Starship prompt."
