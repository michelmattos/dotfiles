#!/bin/sh
# Install user packages from pkglist.txt
sudo pacman -S --needed --noconfirm - < ~/pkglist.txt

# Copy pacman hook to system directory
sudo cp ~/.config/pacman/update-pkglist.hook /etc/pacman.d/hooks/update-pkglist.hook
