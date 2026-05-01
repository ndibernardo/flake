{ ... }:
{
  flake.nixosModules.bash = (
    { pkgs, user, ... }:
    {
      home-manager.users.${user.name}.programs.bash = {
        enable = true;
        profileExtra = ''
          if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = "1" ]; then
            exec sway
          fi
        '';
        initExtra = ''
          source ${pkgs.bash-preexec}/share/bash/bash-preexec.sh
          # PS1="\$ "
          _title_cmd() { echo -ne "\033]0;''${PWD}\007"; }
          PROMPT_COMMAND="''${PROMPT_COMMAND:+''${PROMPT_COMMAND}; }_title_cmd"
          echo "$(date +'%a, %d %b %Y %H:%M')"
        '';
      };
    }
  );
}
