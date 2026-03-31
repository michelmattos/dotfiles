if test -z "$SSH_AUTH_SOCK"
    set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
end

# Auto-add SSH key if not already loaded
if not ssh-add -l &>/dev/null
    ssh-add ~/.ssh/github &>/dev/null
end
