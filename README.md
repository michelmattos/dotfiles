# dotfiles

My CachyOS + Niri dotfiles, managed with [chezmoi](https://www.chezmoi.io/).

## New machine setup

```sh
chezmoi init michelmattos/dotfiles
chezmoi apply
```

This will clone the repo, apply all dotfiles, install packages from `pkglist.txt`, and set up the pacman hook and Zen Browser policies.

After SSH is configured, install wallpapers and fonts from the private usercontent repo:

```sh
ssh-add ~/.ssh/github
~/.config/usercontent/sync.sh
```

Subsequent `chezmoi apply` runs will notify you if the usercontent repo has new content.

## Day-to-day usage

```sh
# Check if anything is out of sync
chezmoi verify

# See what changed
chezmoi diff

# Sync a specific file back to chezmoi
chezmoi add ~/.config/zed/settings.json

# Sync all changed files back to chezmoi
chezmoi re-add

# Apply chezmoi state to the machine (opposite direction)
chezmoi apply
```

