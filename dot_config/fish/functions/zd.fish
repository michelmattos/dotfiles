function zd --description "Fuzzy directory jump using zoxide and fzf"
    set -l result (zoxide query --list | fzf --height 40% --reverse --border)
    if test -n "$result"
        cd "$result"
    end
end
