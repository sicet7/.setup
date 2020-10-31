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

if ! hasCommand uname; then
    echo 'Missing command "uname"';
    exit 1;
fi

if ! hasCommand tr; then
    echo 'Missing command "tr"';
    exit 1;
fi

if ! hasCommand mkdir; then
    echo 'Missing command "mkdir"';
    exit 1;
fi

if ! hasCommand ln; then
    echo 'Missing command "ln"';
    exit 1;
fi

if ! hasCommand rm; then
    echo 'Missing command "rm"';
    exit 1;
fi

if ! hasCommand mv; then
    echo 'Missing command "mv"';
    exit 1;
fi

# Executable path
EXEC_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )";


# Detect OS
CURRENT_OS="";
testDarwin=$(uname -s | tr '[:upper:]' '[:lower:]');

if [ "$testDarwin" = "darwin" ]; then
    CURRENT_OS="Darwin";
fi
if [ "$CURRENT_OS" = "" ]; then
    if [ -f "/etc/os-release" ]; then
        . /etc/os-release
        CURRENT_OS="$NAME";
    fi
fi

echo "Detected OS: $CURRENT_OS"
if [ "$CURRENT_OS" != "Darwin" ] && [ "$CURRENT_OS" != "Ubuntu" ]; then
    echo "$CURRENT_OS, is currently not supported.";
    exit 1;
fi

# Install build files for fish
if [ "$CURRENT_OS" = "Ubuntu" ]; then
    sudo apt update && sudo apt install -y build-essential
fi
# TODO: add MAC install build utillities and maybe update??


# Define symlink function
makeSymlink()
{
    TARGET=$1
    OUTPUT=$2
    if [ ! -f "$TARGET" ] && [ ! -d "$TARGET" ]; then
        echo "Target not found: $TARGET"
        exit 1;
    fi
    if [ -L "$TARGET" ]; then
        echo "Target cannot be another symlink!"
        exit 1;
    fi
    if [ -f "$TARGET" ] || [ -d "$OUTPUT" ]; then
        if [ -L "$OUTPUT" ]; then
            rm -v "$OUTPUT"
        else
            mv -v "$OUTPUT" "$OUTPUT.bak"
        fi
    fi
    OUTPUT_DIR=$(dirname "$OUTPUT");
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir -p "$OUTPUT_DIR"
    fi
    ln -s "$TARGET" "$OUTPUT" && echo "link: $OUTPUT -> $TARGET"
}



# Installer Functions
include "$EXEC_PATH/installer/promptUser.sh"
include "$EXEC_PATH/installer/installPackage.sh"

# Dependencies

include "$EXEC_PATH/dependencies/git/install.sh"
include "$EXEC_PATH/dependencies/fish/install.sh"
include "$EXEC_PATH/dependencies/tmux/install.sh"
include "$EXEC_PATH/dependencies/composer/install.sh"
include "$EXEC_PATH/dependencies/nano/install.sh"
include "$EXEC_PATH/dependencies/ranger/install.sh"
