#!/bin/sh
cd "$SETUP_BUILD" || exit 1;
git clone --depth="1" --branch="v0.11.8" https://github.com/mutagen-io/mutagen.git
go run ./scripts/build.go --mode="local"

if [ ! -f "$SETUP_BUILD/mutagen/build/mutagen" ]; then
    echo "Failed to build mutagen"
    exit 1;
fi

if [ ! -f "$SETUP_BUILD/mutagen/build/mutagen-agents.tar.gz" ]; then
    echo "Failed to build mutagen agents"
    exit 1;
fi

if [ ! -d "$HOME/.local" ]; then
    mkdir -p "$HOME/.local"
fi

if [ ! -d "$HOME/.local/bin" ]; then
    mkdir -p "$HOME/.local/bin"
fi

cp "$SETUP_BUILD/mutagen/build/mutagen" "$HOME/.local/bin/mutagen"
cp "$SETUP_BUILD/mutagen/build/mutagen-agents.tar.gz" "$HOME/.local/bin/mutagen-agents.tar.gz"
echo "Finished installing mutagen"