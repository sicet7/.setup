#!/bin/sh

hasCommand() {
    che=$(which "$1")
    if [ ${#che} -lt 1 ]; then
        return 1;
    else
        return 0;
    fi
}

if ! hasCommand dirname; then
    echo 'Missing command "dirname".';
    exit 1;
fi

if ! hasCommand pwd; then
    echo 'Missing command "pwd".';
    exit 1;
fi

# Executable path
EXEC_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )";

#Note this does not support nested includes
include() {
    SP=$(dirname "$1")
    . "$1"
    unset SP
}

# Test if command dependencies are met.
include "$EXEC_PATH/installer/commandDependencies.sh"

# Detect OS
include "$EXEC_PATH/installer/detectOs.sh"

echo "Detected OS: $CURRENT_OS"
if [ "$CURRENT_OS" != "Darwin" ] && [ "$CURRENT_OS" != "Ubuntu" ]; then
    echo "$CURRENT_OS, is currently not supported.";
    exit 1;
fi

if [ "$CURRENT_OS" = "Ubuntu" ]; then
    sudo apt update
fi

# TODO: add MAC update command?

# Installer Functions
include "$EXEC_PATH/installer/linkDotFile.sh"
include "$EXEC_PATH/installer/installPackage.sh"

# Dependencies

include "$EXEC_PATH/dependencies/git/install.sh"
include "$EXEC_PATH/dependencies/fish/install.sh"
include "$EXEC_PATH/dependencies/tmux/install.sh"
include "$EXEC_PATH/dependencies/composer/install.sh"
include "$EXEC_PATH/dependencies/nano/install.sh"
