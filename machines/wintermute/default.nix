{ inputs, ... }:
let
  colors_marathon = {
    black         = "#000000";
    red           = "#e03355";
    green         = "#c2fe0c";
    yellow        = "#fd6c1d";
    blue          = "#5a2aff";
    magenta       = "#f81d78";
    cyan          = "#63ede0";
    white         = "#c8c8d4";
    brightBlack   = "#3a3a52";
    brightRed     = "#ff4466";
    brightGreen   = "#d0ff20";
    brightYellow  = "#ff8844";
    brightBlue    = "#7a52ff";
    brightMagenta = "#ff50a0";
    brightCyan    = "#88f5ee";
    brightWhite   = "#ffffff";
    base          = "#0e0e1a";
    surface       = "#1a1a2e";
    muted         = "#56566e";
    accent        = "#c2fe0c";
    accentDim     = "#8aba0a";
    fg            = "#bcbccc";
  };
in
{
  machines.wintermute = {
    system = "x86_64-linux";
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
