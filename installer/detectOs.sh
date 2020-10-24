#!/bin/sh


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
