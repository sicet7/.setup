#!/bin/sh

if [ ! -d "$SETUP_ROOT" ]; then
    echo "Failed to find setup files.";
    exit 0;
fi

SETUP_BUILD="$SETUP_ROOT/build";
if [ ! -d "$SETUP_BUILD" ]; then
    mkdir -p "$SETUP_BUILD"
fi

. "$SETUP_ROOT/installers/utilities.sh"

. "$SETUP_ROOT/installers/zsh.sh"

. "$SETUP_ROOT/installers/path.sh"

. "$SETUP_ROOT/installers/aliases.sh"

. "$SETUP_ROOT/installers/starship.sh"

. "$SETUP_ROOT/installers/nano.sh"

. "$SETUP_ROOT/installers/go.sh" && \
. "$SETUP_ROOT/installers/lf.sh" && \
. "$SETUP_ROOT/installers/gotop.sh"

. "$SETUP_ROOT/installers/tmux.sh" && \
. "$SETUP_ROOT/installers/tpm.sh"

. "$SETUP_ROOT/installers/gitconfig.sh"

. "$SETUP_ROOT/installers/nvm.sh"

. "$SETUP_ROOT/installers/docker.sh" && \
. "$SETUP_ROOT/installers/docker-compose.sh"
