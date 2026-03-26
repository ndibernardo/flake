{ inputs, ... }:
{
  machines.wintermute = {
    system = "x86_64-linux";
    colors = {
      black = "#040606";
      red = "#C34043";
      green = "#98BB6C";
      yellow = "#DCA561";
      blue = "#7FB4CA";
      magenta = "#938AA9";
      cyan = "#7AA89F";
      white = "#C5C9C7";
      brightBlack = "#717C7C";
      brightRed = "#E46876";
      brightGreen = "#98BB6C";
      brightYellow = "#E6C384";
      brightBlue = "#658594";
      brightMagenta = "#938AA9";
      brightCyan = "#7AA89F";
      brightWhite = "#DCD7BA";
      base = "#040606";
      surface = "#293030";
      muted = "#555555";
      accent = "#536161";
      accentDim = "#6b7c7c";
      fg = "#eeeeee";
    };
    font = {
      family = "Berkeley Mono";
      style = "Regular SemiCondensed";
      size = 13;
    };
    modules = [
      "alacritty"
      "audio"
      "bluetooth"
      "containers"
      "direnv"
      "docker"
      "documentation"
      "emacs"
      "fail2ban"
      "fonts"
      "fuzzel"
      "git"
      "gnupg"
      "gtk"
      "home-manager"
      "ld"
      "locale"
      "ly"
      "mtr"
      "mullvad"
      "neovim"
      "niri"
      "nix"
      "nvidia"
      "openrgb"
      "openssh"
      "packages"
      "qt"
      "steam"
      "sway"
      "systemd"
      "tailscale"
      "tmux"
      "users"
      "waybar"
      "zsh"
    ];
    nixosModules = [
      inputs.home-manager.nixosModules.home-manager
      ./hardware.nix
      ./networking.nix
      ./security.nix
    ];
    user = {
      name = "nil";
      homeDirectory = "/home/nil";
    };
  };
}
