{ ... }:
{
  flake.nixosModules.zsh = (
    { user, ... }:
    {
      programs.zsh.enable = true;

      home-manager.users.${user.name}.programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        shellAliases = {
          ll = "ls -la";
        };
        initContent = ''
          PROMPT='%F{green}%n@%m %~%f %F{blue}%(!.#.$)%f '
        '';
      };
    }
  );
}
