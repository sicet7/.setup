#!/bin/sh
linkDotFile()
{
    INPUT=$1
    OUTPUT=$2
    if [ ! -f "$INPUT" ] && [ ! -d "$INPUT" ]; then
        echo "Input not found: $INPUT"
        exit 1;
    fi
    if [ -L "$INPUT" ]; then
        echo "Input cannot be a symlink!"
        exit 1;
    fi
    if [ -f "$OUTPUT" ] || [ -d "$OUTPUT" ]; then
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
    ln -s "$INPUT" "$OUTPUT" && echo "link: $OUTPUT -> $INPUT"
}
