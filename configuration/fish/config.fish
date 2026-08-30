if status is-interactive
    set -g fish_greeting
    set -g fish_color_autosuggestion 8a8a8a
    set -g fish_color_param blue
    set -g fish_color_valid_path blue

    alias cat bat
    alias ll 'eza -la --git --group-directories-first'
    alias ls 'eza --group-directories-first'
    alias tree 'eza --tree --git-ignore --level=2 --group-directories-first'

    atuin init fish | source
end
