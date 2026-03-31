function cd --description "Change directory with zoxide fallback"
    if test (count $argv) -eq 0
        builtin cd ~
    else if test -d "$argv[1]"
        builtin cd $argv
    else
        z $argv && printf "\U000F17A9 " && pwd || echo "Directory not found"
    end
end
