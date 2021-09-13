#!/bin/sh
set -e
cp -v "$SETUP_ROOT/config/sharedrc" "$HOME/.sharedrc"
if [ \( ! -f "$HOME/.bashrc" \) -o \( "$(grep -i '.sharedrc; fi' ~/.bashrc | wc -l)" = "0" \) ]; then
    echo "if [ -f ~/.sharedrc ]; then . ~/.sharedrc; fi" >> "$HOME/.bashrc";
fi
echo "Added sharedrc"
