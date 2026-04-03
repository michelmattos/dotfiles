#!/bin/sh
# Remove any files that may conflict with package installations
sudo rm -f /opt/zen-browser-bin/distribution/policies.json

# Install user packages from pkglist.txt
paru -S --needed --noconfirm - < ~/pkglist.txt

# Copy pacman hook to system directory
sudo mkdir -p /etc/pacman.d/hooks
sudo cp ~/.config/pacman/update-pkglist.hook /etc/pacman.d/hooks/update-pkglist.hook
