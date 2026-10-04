if status is-interactive
    set -g fish_greeting
    set -g fish_color_autosuggestion brblack
    set -g fish_color_command brwhite
    set -g fish_color_param white
    set -g fish_color_valid_path

    alias cat bat
    alias ll 'eza -la --git --group-directories-first'
    alias ls 'eza --group-directories-first'
    alias top btop
    alias tree 'eza --tree --git-ignore --level=2 --group-directories-first'

    atuin init fish | source
end
