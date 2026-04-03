#!/bin/sh
echo "[gcr-ssh-agent] Enabling gcr-ssh-agent socket for SSH key management via gnome-keyring..."
systemctl --user enable --now gcr-ssh-agent.socket

echo "[gcr-ssh-agent] Checking if SSH key passphrase is stored in keyring..."
if secret-tool lookup unique "ssh-store:$HOME/.ssh/github" > /dev/null 2>&1; then
    echo "[gcr-ssh-agent] Passphrase already stored. Done."
else
    echo "[gcr-ssh-agent] Storing SSH key passphrase in gnome-keyring (you will be prompted once)..."
    secret-tool store \
        --label="Unlock password for: 7696411+michelmattos@users.noreply.github.com" \
        unique "ssh-store:$HOME/.ssh/github"
    echo "[gcr-ssh-agent] Done."
fi
