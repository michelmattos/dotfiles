#!/bin/sh
# Clones michelmattos/usercontent, runs install scripts, and saves the latest commit hash.

set -e

repo="git@github.com:michelmattos/usercontent.git"
state_file="$HOME/.config/usercontent/.last-commit"
tmpdir=$(mktemp -d)

echo "Syncing usercontent repo..."
git clone --depth 1 "$repo" "$tmpdir"

sh "$tmpdir/install-wallpapers.sh"
sh "$tmpdir/install-fonts.sh"

git -C "$tmpdir" rev-parse HEAD > "$state_file"
echo "Synced to commit $(cat "$state_file")"

rm -rf "$tmpdir"
