function fish_prompt
    set_color normal
    set -l dir (basename $PWD)
    test "$PWD" = "$HOME"; and set dir '~'
    printf '%s $ ' $dir
end
