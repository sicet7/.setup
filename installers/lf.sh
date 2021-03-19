#!/bin/sh
go clean -cache
go clean -modcache
env CGO_ENABLED=0 GO111MODULE=on go get -u -ldflags="-s -w" github.com/gokcehan/lf
echo "Installed LF"
