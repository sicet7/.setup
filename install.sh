#!/bin/sh

SCRIPT_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )";

which=$(which git);
if [ ${#which} -lt 1 ]; then
    echo "Missing access to \"git\" command.";
    exit 1;
fi

linkDotFile()
{
    INPUT=$1
    OUTPUT=$2
    if [ -L "$INPUT" ]; then
        echo "Input cannot be a symlink!"
        exit 1;
    fi
    if [ ! -f "$INPUT" ] && [ ! -d "$INPUT" ]; then
        echo "Input not found: $INPUT"
        exit 1;
    fi
    if [ -f "$OUTPUT" ] || [ -d "$OUTPUT" ]; then
        if [ -L "$OUTPUT" ]; then
            rm -v "$OUTPUT"
        else
            mv -v "$OUTPUT" "$OUTPUT.bak"
        fi
    fi
    ln -s "$INPUT" "$OUTPUT"
}

git clone https://github.com/tmux-plugins/tpm "$SCRIPT_PATH/tmux/.tmux"

linkDotFile "$SCRIPT_PATH/tmux/.tmux.conf" "$HOME/.tmux.conf"
linkDotFile "$SCRIPT_PATH/tmux/.tmux" "$HOME/.tmux"

