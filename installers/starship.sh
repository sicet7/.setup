#!/bin/sh
set -e
sh -c "$(curl -fsSL https://starship.rs/install.sh)" "install.sh" --yes
mkdir -p "$HOME/.config"
cp -v "$SETUP_ROOT/config/starship.toml" "$HOME/.config/starship.toml"
echo "Installed Starship prompt."
