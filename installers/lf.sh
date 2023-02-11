#!/bin/sh
set -e
env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest
echo "Installed LF"
