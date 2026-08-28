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
                "bluetooth"
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
              bluetooth = {
                format = "${i.bluetooth} ON";
                "format-disabled" = "${i.bluetooth} OFF";
                "format-off" = "${i.bluetooth} OFF";
                "format-connected" = "${i.bluetooth} {device_alias}";
                "format-connected-battery" = "${i.bluetooth} {device_alias} {device_battery_percentage}%";
                "tooltip-format" = "{controller_alias}\t{controller_address}";
                "tooltip-format-connected" = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
                "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
                "tooltip-format-enumerate-connected-battery" = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
                "on-click" = "blueman-manager";
              };
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
              @define-color bg #16161d;
              @define-color surface #1e1e28;
              @define-color raised #292936;
              @define-color fg #efeff4;
              @define-color muted #9999aa;
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
                background-color: @bg;
                color: @fg;
              }

              window#waybar.hidden {
                opacity: 0.35;
              }

              tooltip {
                background-color: @surface;
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

              #bluetooth.off,
              #bluetooth.disabled {
                color: @muted;
              }

              #bluetooth.connected {
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
