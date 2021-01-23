#!/bin/sh
echo "$SETUP_ROOT";

if [ ! -d "$SETUP_ROOT" ]; then
    echo "Failed to find setup files.";
    exit 0;
fi

. "$SETUP_ROOT/installers/fish.sh" && \
. "$SETUP_ROOT/installers/fisher.sh"

. "$SETUP_ROOT/installers/nano.sh"
