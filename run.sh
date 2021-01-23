#!/bin/sh

if [ ! -d "$SETUP_ROOT" ]; then
    echo "Failed to find setup files.";
    exit 0;
fi

SETUP_BUILD="$SETUP_ROOT/build";
if [ ! -d "$SETUP_BUILD" ]; then
    mkdir -p "$SETUP_BUILD"
fi

. "$SETUP_ROOT/installers/fish.sh" && \
. "$SETUP_ROOT/installers/fisher.sh"

. "$SETUP_ROOT/installers/nano.sh"
