#!/bin/sh

if ! hasCommand git; then
    installPackage "git"
fi

#Git Config
linkDotFile "$SP/src/.gitconfig" "$HOME/.gitconfig"
