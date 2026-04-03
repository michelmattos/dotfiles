#!/bin/sh
# Check if usercontent repo has new content and notify user if so.

repo="git@github.com:michelmattos/usercontent.git"
state_file="$HOME/.config/usercontent/.last-commit"

# Skip if SSH key is not loaded
if ! ssh-add -l > /dev/null 2>&1; then
    echo "usercontent: SSH key not loaded, skipping check. Run 'ssh-add ~/.ssh/github' and re-run 'chezmoi apply' to check for updates."
    exit 0
fi

# Get remote HEAD commit (fails silently if no SSH access)
remote_commit=$(git ls-remote "$repo" HEAD 2>/dev/null | cut -f1)
if [ -z "$remote_commit" ]; then
    echo "usercontent: could not reach remote repo, skipping check."
    exit 0
fi

# First run — no state file yet
if [ ! -f "$state_file" ]; then
    echo "usercontent: not synced yet. Run '~/.config/usercontent/sync.sh' to install wallpapers and fonts."
    exit 0
fi

local_commit=$(cat "$state_file")
if [ "$remote_commit" != "$local_commit" ]; then
    echo "usercontent: repo has new content. Run '~/.config/usercontent/sync.sh' to sync."
fi
