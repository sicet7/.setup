#!/bin/sh

installIfMissing "git" "git"

#Git Config
linkDotFile "$SP/src/.gitconfig" "$HOME/.gitconfig"
