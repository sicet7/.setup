#!/bin/sh

sudo apt update

EXEC_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )";

#Note this does not support nested includes
include() {
    SP=$(dirname "$1")
    . "$1"
    unset SP
}

# Installer Functions
include "$EXEC_PATH/installer/installIfMissing.sh"
include "$EXEC_PATH/installer/linkDotFile.sh"

# Dependencies

include "$EXEC_PATH/dependencies/git/install.sh"
include "$EXEC_PATH/dependencies/fish/install.sh"
include "$EXEC_PATH/dependencies/tmux/install.sh"
include "$EXEC_PATH/dependencies/composer/install.sh"
