#!/bin/sh

FISH_VERSION="3.1.2"

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

if ! hasCommand readlink; then
    echo 'Missing command "readlink"';
    exit 1;
fi

if ! hasCommand basename; then
    echo 'Missing command "basename"';
    exit 1;
fi

# Get full path to this file.
EXEC_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )";

sudo apt update && sudo apt install -y build-essential cmake ncurses-dev ncurses-dev libpcre2-dev gettext

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

#Building fish from source
if [ ! -d "$EXEC_PATH/src" ]; then
    mkdir -p "$EXEC_PATH/src"
fi

FISH_SOURCE_DIR="$EXEC_PATH/src/fish/$FISH_VERSION"
FISH_BUILD_DIR="$EXEC_PATH/build/fish/$FISH_VERSION"
FISH_CURRENT_LINK="$EXEC_PATH/build/fish/current"

if [ ! -d "$FISH_SOURCE_DIR" ]; then

    # Download the version from github.
    git clone --depth="1" --branch="$FISH_VERSION" https://github.com/fish-shell/fish-shell.git "$FISH_SOURCE_DIR"

    # Installation output directory
    if [ ! -d "$FISH_BUILD_DIR" ]; then
        mkdir -p "$FISH_BUILD_DIR"
    fi

    # Storing our current directory.
    BEFORE_BUILD_DIR=$(pwd);

    # Build fish into the output directory and go back to the directory we were before.
    cd "$FISH_SOURCE_DIR" && cmake -DCMAKE_INSTALL_PREFIX="$FISH_BUILD_DIR" && make && make install && cd "$BEFORE_BUILD_DIR"
    unset BEFORE_BUILD_DIR

    # If current link exists uninstall old version after linking the new one
    if [ -L "$FISH_CURRENT_LINK" ]; then
        PREVIOUS_VERSION_BUILD=$(readlink -f "$FISH_CURRENT_LINK");
        makeSymlink "$FISH_BUILD_DIR" "$FISH_CURRENT_LINK"
        echo "New Fish version($FISH_VERSION) successfully installed."

        # Remove previous version build.
        if [ -d "$PREVIOUS_VERSION_BUILD" ]; then
            rm -rfv "$PREVIOUS_VERSION_BUILD"
        fi

        PREVIOUS_VERSION=$(basename "$PREVIOUS_VERSION_BUILD");
        PREVIOUS_VERSION_SRC="$EXEC_PATH/src/fish/$PREVIOUS_VERSION"

        # Remove previous version source.
        if [ -d "$PREVIOUS_VERSION_SRC" ]; then
            rm -rfv "$PREVIOUS_VERSION_SRC"
        fi

    else
        # Make current link to the new version
        makeSymlink "$FISH_BUILD_DIR" "$FISH_CURRENT_LINK"
        echo "Fish version: $FISH_VERSION successfully installed."
    fi

else
    makeSymlink "$FISH_BUILD_DIR" "$FISH_CURRENT_LINK"
    echo "Fish Version: $FISH_VERSION is already installed.";
fi
