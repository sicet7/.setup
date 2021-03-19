#!/bin/sh
go version
go clean -cache -modcache -i -r
go get -u github.com/xxxserxxx/gotop/cmd/gotop
echo "Installed gotop"
