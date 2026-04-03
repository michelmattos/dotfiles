#!/bin/sh
echo "[gcr-ssh-agent] Enabling gcr-ssh-agent socket for SSH key management via gnome-keyring..."
systemctl --user enable --now gcr-ssh-agent.socket
echo "[gcr-ssh-agent] Done. Run 'ssh-add ~/.ssh/github' once and tick 'Automatically unlock this key whenever I'm logged in'."
