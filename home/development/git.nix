{ ... }:
{
  programs.git = {
    enable = true;
    user = {
      email = "nicola.dibernardo@icloud.com";
      name = "ndibernardo";
    };
    ignores = [
      ".classpath"
      ".direnv"
      ".dir-locals.el"
      ".idea"
      ".project"
      ".settings"
      "TAGS"
    ];
  };
}
