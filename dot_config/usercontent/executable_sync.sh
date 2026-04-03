#!/bin/sh
# Clones michelmattos/usercontent, runs install scripts, and saves the latest commit hash.

set -e

repo="git@github.com:michelmattos/usercontent.git"
state_file="$HOME/.config/usercontent/.last-commit"

# Check remote HEAD before cloning
remote_commit=$(git ls-remote "$repo" HEAD 2>/dev/null | cut -f1)
if [ -z "$remote_commit" ]; then
    echo "usercontent: could not reach remote repo."
    exit 1
fi

if [ -f "$state_file" ] && [ "$(cat "$state_file")" = "$remote_commit" ]; then
    echo "usercontent: already up to date."
    exit 0
fi

tmpdir=$(mktemp -d)
echo "Syncing usercontent repo..."
git clone --depth 1 "$repo" "$tmpdir"

sh "$tmpdir/install-wallpapers.sh"
sh "$tmpdir/install-fonts.sh"

echo "$remote_commit" > "$state_file"
echo "Synced to commit $remote_commit"

rm -rf "$tmpdir"
