#!/bin/sh
# Clone usercontent repo and install wallpapers
tmpdir=$(mktemp -d)
git clone git@github.com:michelmattos/usercontent.git "$tmpdir"
sh "$tmpdir/install-wallpapers.sh"
rm -rf "$tmpdir"
