#!/bin/sh

if ! hasCommand ragner; then
    installPackage "ranger"
fi

linkDotFile "$SP/src/rc.conf" "$HOME/.config/ranger/rc.conf"
