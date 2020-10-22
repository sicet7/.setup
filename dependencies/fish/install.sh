#!/bin/sh

# Dependencies
installIfMissing "fish" "fish"
installIfMissing "wget" "wget"
installIfMissing "ranger" "ranger"

# Download Fisher
FISHER_FILE="$SP/src/functions/fisher.fish"
if [ ! -d $(dirname "$FISHER_FILE") ]; then
    mkdir -p $(dirname "$FISHER_FILE")
fi
if [ -f "$FISHER_FILE" ]; then
    rm -fv "$FISHER_FILE"
fi
wget https://git.io/fisher --output-document="$FISHER_FILE"

# Link Fish Files
linkDotFile "$SP/src/config.fish" "$HOME/.config/fish/config.fish"
linkDotFile "$SP/src/aliases.fish" "$HOME/.config/fish/aliases.fish"
linkDotFile "$FISHER_FILE" "$HOME/.config/fish/functions/fisher.fish"
linkDotFile "$SP/src/fishfile" "$HOME/.config/fish/fishfile"

# Run Fisher Plugin installer
fish -c fisher
