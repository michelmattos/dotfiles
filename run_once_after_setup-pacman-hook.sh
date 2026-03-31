#!/bin/sh
# Copy pacman hook to system directory (requires sudo)
sudo cp ~/.config/pacman/update-pkglist.hook /etc/pacman.d/hooks/update-pkglist.hook
