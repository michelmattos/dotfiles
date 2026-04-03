#!/bin/sh
# Install user packages from pkglist.txt
paru -S --needed --noconfirm --overwrite '/opt/*' - < ~/pkglist.txt

# Copy pacman hook to system directory
sudo mkdir -p /etc/pacman.d/hooks
sudo cp ~/.config/pacman/update-pkglist.hook /etc/pacman.d/hooks/update-pkglist.hook
