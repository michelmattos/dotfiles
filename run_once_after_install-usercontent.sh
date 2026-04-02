#!/bin/sh
# Clone usercontent repo and install wallpapers + fonts
tmpdir=$(mktemp -d)
git clone --depth 1 git@github.com:michelmattos/usercontent.git "$tmpdir"
sh "$tmpdir/install-wallpapers.sh"
sh "$tmpdir/install-fonts.sh"
rm -rf "$tmpdir"
