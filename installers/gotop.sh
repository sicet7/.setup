#!/bin/sh
go version
go clean -cache
go clean -modcache
go get -u github.com/xxxserxxx/gotop/cmd/gotop
echo "Installed gotop"
