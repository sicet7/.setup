#!/bin/sh
cd "$SETUP_BUILD" || exit 1;
VERSION="4.1.1";
git clone --depth="1" --branch="v$VERSION" https://github.com/xxxserxxx/gotop.git
cd gotop || exit 1;
sed -i '/^go/d' go.mod
go build -o gotop \
	-ldflags "-X main.Version=v${VERSION} -X main.BuildDate=$(date +%Y%m%dT%H%M%S)" \
	./cmd/gotop

if [ ! -d "$HOME/.local" ]; then
    mkdir -p "$HOME/.local"
fi

if [ ! -d "$HOME/.local/bin" ]; then
    mkdir -p "$HOME/.local/bin"
fi

if [ ! -f "$SETUP_BUILD/gotop/gotop" ]; then
    echo "gotop build failed"
    exit 1;
fi
cp "$SETUP_BUILD/gotop/gotop" "$HOME/.local/bin/gotop" && chmod +x "$HOME/.local/bin/gotop"

echo "Installed gotop"
