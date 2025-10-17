{ ... }:
{
  programs.git = {
    enable = true;
    userEmail = "nicola.dibernardo@icloud.com";
    userName = "ndibernardo";
    ignores = [
      ".direnv"
      ".dir-locals.el"
      ".idea"
      ".classpath"
      ".project"
      ".settings"
      "TAGS"
    ];
  };
}
