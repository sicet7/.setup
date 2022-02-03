#!/bin/sh
export PROFILE="$SETUP_ROOT/config/sharedrc"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
echo "Installed NVM"
