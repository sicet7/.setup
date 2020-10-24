#!/bin/sh

if ! hasCommand nano; then
    installPackage "nano"
fi

linkDotFile "$SP/src/.nanorc" "$HOME/.nanorc"
