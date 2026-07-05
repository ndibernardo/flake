{ ... }:
{
  flake.nixosModules.waybar = (
    { pkgs, user, ... }:
    {
      home-manager.users.${user.name}.home.packages = with pkgs; [
        pavucontrol
        waybar
      ];
    }
  );
}
