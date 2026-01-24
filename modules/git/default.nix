{ ... }:
{
  home-manager.users.nil.programs.git = {
    enable = true;
    settings = {
      user = {
        email = "nicola.dibernardo@icloud.com";
        name = "ndibernardo";
      };
    };
    ignores = [
      ".classpath"
      ".claude"
      ".direnv"
      ".dir-locals.el"
      ".DS_STORE"
      ".idea"
      ".project"
      ".settings"
      "target"
      "TAGS"
    ];
  };
}
