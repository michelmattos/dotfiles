#!/usr/bin/env fish

if not test -d ~/.config/tmux/plugins/tpm
  git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
end
