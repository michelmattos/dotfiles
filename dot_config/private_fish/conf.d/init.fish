if command -v mise >/dev/null 2>&1
  mise activate fish | source
end

if command -v zoxide >/dev/null 2>&1
  zoxide init fish | source
end

if command -v fzf >/dev/null 2>&1
  fzf --fish | source
end
