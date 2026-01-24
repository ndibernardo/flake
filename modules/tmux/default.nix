{ pkgs, ... }:

{
  home-manager.users.nil.programs.tmux = {
    enable = true;

    # Use Ctrl+Space as prefix
    prefix = "C-a";

    # Use vi mode keys
    keyMode = "vi";

    # Start windows and panes at 1, not 0
    baseIndex = 1;

    # Remove delay for entering copy mode
    escapeTime = 0;

    # Keep plenty of history
    historyLimit = 10000;

    # Enable mouse support
    mouse = true;

    # Terminal settings
    terminal = "screen-256color";

    # Clock in 24 hour format
    clock24 = true;

    # Plugins
    plugins = with pkgs.tmuxPlugins; [
      yank
      {
        plugin = tmux-fzf;
        extraConfig = ''
          TMUX_FZF_LAUNCH_KEY="C-f"
        '';
      }
    ];

    extraConfig = ''
      # Bind prefix twice to send prefix
      bind C-Space send-prefix

      # Kanso Zen theme colors
      set -g status-style "bg=#090E13,fg=#C5C9C7"
      set -g window-status-style "bg=default,fg=#717C7C"
      set -g window-status-format " #I: #W "
      set -g window-status-current-style "bg=#98BB6C,fg=#090E13,bold"
      set -g window-status-current-format " #I: #W "
      set -g pane-border-style "fg=#393B44"
      set -g pane-active-border-style "fg=#98BB6C"
      set -g message-style "bg=#DCA561,fg=#090E13"

      # Status bar configuration
      set -g status-interval 2
      set -g status-right-length 59
      set -g status-left ""
      set -g status-right '#[bg=#98BB6C,fg=#090E13] %Y-%m-%d  %H:%M '
      set-option -g status-position top

      # Add spacing between window tabs
      setw -g window-status-separator '  '

      # Pane base index
      set-window-option -g pane-base-index 1

      # Reload config file
      bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"

      # Horizontal and vertical splits with current path
      bind \\ split-window -h -c '#{pane_current_path}'
      bind - split-window -v -c '#{pane_current_path}'

      # New window with current path
      bind c new-window -c "#{pane_current_path}"

      # Break pane
      bind b break-pane -d

      # Resize panes using arrow keys
      bind Right resize-pane -R 5
      bind Left resize-pane -L 5
      bind Up resize-pane -U 2
      bind Down resize-pane -D 2

      # Smart pane switching with awareness of vim splits
      bind -n C-h run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-h) || tmux select-pane -L"
      bind -n C-j run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-j) || tmux select-pane -D"
      bind -n C-k run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-k) || tmux select-pane -U"
      bind -n C-l run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-l) || tmux select-pane -R"
      bind -n C-\\ run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys 'C-\\') || tmux select-pane -l"

      # Copy mode bindings
      bind Escape copy-mode
      bind C-[ copy-mode
      bind p paste-buffer

      # Vi-style selection and yanking in copy mode
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      # Break pane into new session
      bind-key C-b send-keys 'tat && exit' 'C-m'

      # Open man page in split
      bind-key C-m command-prompt -p "command:" "split-window -h 'man %%'"

      # Run command in new split
      bind-key C-c command-prompt -p "command:" "split-window -c '#{pane_current_path}' '%%'"

      # Kill session
      bind-key K run-shell 'tmux switch-client -n \; kill-session -t "$(tmux display-message -p "#S")" || tmux kill-session'

      # Enable clipboard integration
      set-option -g set-clipboard on

      # macOS specific: uncomment if on macOS
      # set-option -g default-command "reattach-to-user-namespace -l $SHELL"
    '';
  };
}
