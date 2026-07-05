{ ... }:
{
  flake.nixosModules.labwc = (
    {
      pkgs,
      lib,
      user,
      ...
    }:
    {
      programs.labwc.enable = true;

      environment.systemPackages = [
        pkgs.swayidle
        pkgs.swaylock
        pkgs.grim
        pkgs.slurp
        pkgs.swaybg
        pkgs.networkmanagerapplet
      ];

      home-manager.users.${user.name} =
        let
          waybarLib = import ../waybar/_lib.nix { inherit pkgs user; };
          waybar = waybarLib.mkWaybar {
            left = [
              "ext/workspaces"
              "wlr/taskbar"
            ];
            right = [
              "pulseaudio"
              "network"
              "tray"
              "clock"
            ];
          };
        in
        {
          home.file.".config/labwc/autostart" = {
            executable = true;
            text = ''
              #!/bin/sh
              theme-apply &
              (
                exec 9>"''${XDG_RUNTIME_DIR:-/tmp}/labwc-waybar.lock"
                if ${pkgs.util-linux}/bin/flock -n 9; then
                  while ${pkgs.procps}/bin/pgrep -x labwc >/dev/null 2>&1; do
                    waybar --config "$HOME/.config/waybar/config-labwc" --style "$HOME/.config/waybar/style-labwc.css"
                    sleep 1
                  done
                fi
              ) &
              ${pkgs.openrgb}/bin/openrgb --mode static --color 000000 &
              ${pkgs.networkmanagerapplet}/bin/nm-applet &
              ${pkgs.solaar}/bin/solaar --window=hide &
              ${pkgs.tailscale}/bin/tailscale systray &
              systemctl --user import-environment PATH WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
              hash dbus-update-activation-environment 2>/dev/null && \
                dbus-update-activation-environment --systemd PATH WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
              gsettings set org.gnome.desktop.interface cursor-theme Adwaita
              gsettings set org.gnome.desktop.interface cursor-size 16
              swayidle -w \
                timeout 1800 'swaylock -f -c 545454' \
                before-sleep 'swaylock -f -c 545454' &
            '';
          };

          home.file.".config/labwc/environment".text = ''
            XCURSOR_THEME=Adwaita
            XCURSOR_SIZE=16
            GTK_IM_MODULE=simple
            XKB_DEFAULT_LAYOUT=us
            XKB_DEFAULT_VARIANT=intl
          '';

          xdg.configFile."labwc/rc.xml".text = ''
            <?xml version="1.0" encoding="UTF-8"?>
            <labwc_config>

              <core>
                <gap>10</gap>
                <adaptiveSync>yes</adaptiveSync>
              </core>

              <desktops>
                <number>4</number>
                <names>
                  <name>1</name>
                  <name>2</name>
                  <name>3</name>
                  <name>4</name>
                </names>
                <popupTime>0</popupTime>
              </desktops>

              <theme>
                <name>adwaita-labwc</name>
                <cornerRadius>5</cornerRadius>
                <font place="ActiveWindow">
                  <name>Sans</name>
                  <size>11</size>
                  <weight>Bold</weight>
                  <slant>Normal</slant>
                </font>
                <font place="InactiveWindow">
                  <name>Sans</name>
                  <size>11</size>
                  <weight>Normal</weight>
                  <slant>Normal</slant>
                </font>
                <font place="MenuItem">
                  <name>Sans</name>
                  <size>11</size>
                </font>
                <font place="OnScreenDisplay">
                  <name>Sans</name>
                  <size>11</size>
                </font>
              </theme>

              <focus>
                <followMouse>yes</followMouse>
                <raiseOnFocus>no</raiseOnFocus>
              </focus>

              <keyboard>
                <default/>

                <keybind key="W-Return">
                  <action name="Execute"><command>ghostty</command></action>
                </keybind>
                <keybind key="W-d">
                  <action name="Execute"><command>fuzzel</command></action>
                </keybind>
                <keybind key="W-q">
                  <action name="Close"/>
                </keybind>
                <keybind key="W-F8">
                  <action name="Execute"><command>theme-toggle</command></action>
                </keybind>
                <keybind key="W-f">
                  <action name="ToggleFullscreen"/>
                </keybind>
                <keybind key="W-S-space">
                  <action name="ToggleMaximize"/>
                </keybind>
                <keybind key="W-Tab">
                  <action name="NextWindow"/>
                </keybind>
                <keybind key="W-S-Tab">
                  <action name="PrevWindow"/>
                </keybind>

                <keybind key="W-1"><action name="GoToDesktop"><to>1</to></action></keybind>
                <keybind key="W-2"><action name="GoToDesktop"><to>2</to></action></keybind>
                <keybind key="W-3"><action name="GoToDesktop"><to>3</to></action></keybind>
                <keybind key="W-4"><action name="GoToDesktop"><to>4</to></action></keybind>
                <keybind key="W-comma">
                  <action name="GoToDesktop"><to>right</to><wrap>yes</wrap></action>
                </keybind>

                <keybind key="W-S-1"><action name="SendToDesktop"><to>1</to></action></keybind>
                <keybind key="W-S-2"><action name="SendToDesktop"><to>2</to></action></keybind>
                <keybind key="W-S-3"><action name="SendToDesktop"><to>3</to></action></keybind>
                <keybind key="W-S-4"><action name="SendToDesktop"><to>4</to></action></keybind>

                <keybind key="W-Left">
                  <action name="SnapEdge"><direction>left</direction></action>
                </keybind>
                <keybind key="W-Right">
                  <action name="SnapEdge"><direction>right</direction></action>
                </keybind>
                <keybind key="W-Up">
                  <action name="SnapEdge"><direction>up</direction></action>
                </keybind>
                <keybind key="W-Down">
                  <action name="SnapEdge"><direction>down</direction></action>
                </keybind>

                <keybind key="Print">
                  <action name="Execute">
                    <command>${pkgs.grim}/bin/grim -t png</command>
                  </action>
                </keybind>
                <keybind key="W-Print">
                  <action name="Execute">
                    <command>sh -c '${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" -t png'</command>
                  </action>
                </keybind>

                <keybind key="XF86AudioMute">
                  <action name="Execute">
                    <command>pactl set-sink-mute @DEFAULT_SINK@ toggle</command>
                  </action>
                </keybind>
                <keybind key="XF86AudioLowerVolume">
                  <action name="Execute">
                    <command>pactl set-sink-volume @DEFAULT_SINK@ -5%</command>
                  </action>
                </keybind>
                <keybind key="XF86AudioRaiseVolume">
                  <action name="Execute">
                    <command>pactl set-sink-volume @DEFAULT_SINK@ +5%</command>
                  </action>
                </keybind>
                <keybind key="XF86AudioMicMute">
                  <action name="Execute">
                    <command>pactl set-source-mute @DEFAULT_SOURCE@ toggle</command>
                  </action>
                </keybind>
              </keyboard>

              <pointer>
                <scrollFactor>5</scrollFactor>
              </pointer>

              <mouse>
                <default/>
                <context name="Root">
                  <mousebind button="Right" action="Press">
                    <action name="ShowMenu"><menu>root-menu</menu></action>
                  </mousebind>
                </context>
              </mouse>

              <outputs>
                <output>
                  <name>DP-4</name>
                  <mode>3840x2160@240.016Hz</mode>
                  <position>
                    <x>0</x>
                    <y>0</y>
                  </position>
                </output>
              </outputs>

            </labwc_config>
          '';

          xdg.configFile."labwc/menu.xml".text = ''
            <?xml version="1.0" encoding="UTF-8"?>
            <openbox_menu>
              <menu id="root-menu" label="Root menu">
                <item label="Files">
                  <action name="Execute"><command>thunar</command></action>
                </item>
                <item label="Terminal">
                  <action name="Execute"><command>ghostty</command></action>
                </item>
                <item label="Firefox">
                  <action name="Execute"><command>firefox</command></action>
                </item>
                <item label="Screenshot Area">
                  <action name="Execute">
                    <command>sh -c '${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" -t png'</command>
                  </action>
                </item>
                <separator/>
                <item label="Reload Configuration">
                  <action name="Reconfigure"/>
                </item>
                <item label="Exit">
                  <action name="Exit"/>
                </item>
              </menu>
            </openbox_menu>
          '';

          xdg.configFile."waybar/config-labwc".text = builtins.toJSON waybar.settings;

          xdg.configFile."waybar/style-labwc.css".text = waybar.style;
        };

      xdg.portal.config.labwc = {
        default = lib.mkForce [
          "wlr"
          "gtk"
        ];
        "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
      };
    }
  );
}
