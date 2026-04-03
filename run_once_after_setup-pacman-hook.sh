#!/bin/sh
echo "[pacman-hook] Removing conflicting files..."
sudo rm -f /opt/zen-browser-bin/distribution/policies.json

echo "[pacman-hook] Installing packages from pkglist.txt..."
paru -S --needed --noconfirm - < ~/pkglist.txt || true
echo "[pacman-hook] Package installation done."

echo "[pacman-hook] Copying pacman hook to system directory..."
sudo mkdir -p /etc/pacman.d/hooks
sudo cp ~/.config/pacman/update-pkglist.hook /etc/pacman.d/hooks/update-pkglist.hook
echo "[pacman-hook] Done."
