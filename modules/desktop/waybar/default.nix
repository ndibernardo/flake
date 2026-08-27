{
  flake.nixosModules.desktop-waybar =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.desktop.waybar;
      user = config.user;
      icon = cp: "<span font_family='Symbols Nerd Font'>${builtins.fromJSON ''"\u${cp}"''}</span>";
      i = {
        wifi = icon "f1eb";
        ethernet = icon "f108";
        warning = icon "f071";
        headphone = icon "f025";
        bluetooth = icon "f293";
        phone = icon "f095";
        mobile = icon "f10b";
        car = icon "f1b9";
        volMute = icon "f026";
        volLow = icon "f027";
        volHigh = icon "f028";
      };
    in
    {
      options.desktop.waybar.enable = lib.mkEnableOption "Waybar";

      config = lib.mkIf cfg.enable {
        core.home-manager.enable = true;

        home-manager.users.${user.name} = {
          home.packages = with pkgs; [ pavucontrol ];

          programs.waybar = {
            enable = true;

            settings.mainBar = {
              layer = "top";
              position = "top";
              height = 36;
              spacing = 0;
              "modules-left" = [
                "sway/workspaces"
                "sway/mode"
              ];
              "modules-center" = [ "sway/window" ];
              "modules-right" = [
                "pulseaudio"
                "network"
                # "cpu"
                # "memory"
                "tray"
                "clock"
              ];
              "sway/mode" = {
                format = "MODE // {}";
                tooltip = false;
              };
              "sway/window" = {
                "max-length" = 80;
                "separate-outputs" = true;
              };
              tray.spacing = 8;
              clock = {
                "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                format = "TIME // {:%H:%M}";
                "format-alt" = "DATE // {:%Y.%m.%d}";
              };
              cpu = {
                format = "{usage}% load";
                tooltip = false;
              };
              memory.format = "{}% mem";
              network = {
                interface = "wlp9s0";
                "format-wifi" = "${i.wifi} {signalStrength}%";
                "format-ethernet" = "${i.ethernet} {ipaddr}/{cidr}";
                "tooltip-format" = "{ifname} via {gwaddr} ";
                "format-linked" = "${i.ethernet} {ifname} (No IP)";
                "format-disconnected" = "${i.warning} OFFLINE";
                "on-click" = "nm-connection-editor";
              };
              pulseaudio = {
                format = "{volume}% {icon}";
                "format-bluetooth" = "{volume}% {icon} {format_source}";
                "format-bluetooth-muted" = "${i.volMute} {icon} {format_source}";
                "format-muted" = "${i.volMute} {format_source}";
                "format-source" = "{volume}% ";
                "format-source-muted" = "";
                "format-icons" = {
                  headphone = i.headphone;
                  "hands-free" = i.bluetooth;
                  headset = i.headphone;
                  phone = i.phone;
                  portable = i.mobile;
                  car = i.car;
                  default = [
                    i.volMute
                    i.volLow
                    i.volHigh
                  ];
                };
                "on-click" = "pavucontrol";
              };
            };

            style = ''
              @define-color bg #121212;
              @define-color surface #1a1a1a;
              @define-color raised #303030;
              @define-color fg #efefef;
              @define-color muted #999999;
              @define-color accent #f97316;
              @define-color urgent #e31b23;

              * {
                border: none;
                border-radius: 0;
                min-height: 0;
                font-family: 'Departure Mono', 'Symbols Nerd Font';
                font-size: 15px;
                font-weight: 400;
              }

              window#waybar {
                background-color: @surface;
                color: @fg;
              }

              window#waybar.hidden {
                opacity: 0.35;
              }

              tooltip {
                background-color: @bg;
                color: @fg;
              }

              tooltip label {
                padding: 6px 8px;
              }

              .module {
                margin: 0;
                padding: 0 10px;
              }

              #workspaces {
                margin: 0;
                padding: 0;
              }

              #workspaces button {
                min-width: 28px;
                padding: 0 8px;
                color: @muted;
                border-bottom: 2px solid transparent;
                box-shadow: none;
                background-color: transparent;
                background-image: none;
              }

              #workspaces button:hover {
                background-color: @raised;
                background-image: none;
                color: @fg;
                box-shadow: none;
                text-shadow: none;
              }

              #workspaces button.visible {
                color: @fg;
              }

              #workspaces button.active,
              #workspaces button.focused,
              #workspaces button.active:hover,
              #workspaces button.focused:hover {
                color: @fg;
                background-color: transparent;
                background-image: none;
                border-bottom-color: @accent;
              }

              #workspaces button.urgent {
                color: @fg;
                background-color: @urgent;
                border-bottom-color: @urgent;
              }

              #mode {
                color: @bg;
                background-color: @accent;
              }

              #window {
                color: @fg;
              }

              #window.empty {
                background-color: transparent;
              }

              #tray {
                background-color: transparent;
              }

              #tray > .passive {
                opacity: 0.65;
              }

              #tray > .needs-attention {
                background-color: @urgent;
              }

              #pulseaudio.muted {
                color: @muted;
              }

              #network.disconnected {
                color: @accent;
              }

              #clock {
                color: @accent;
              }
            '';
          };
        };
      };
    };
}
