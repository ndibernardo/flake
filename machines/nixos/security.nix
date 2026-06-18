{ ... }:
{
  boot.extraModprobeConfig = ''
    install dccp /bin/true
    install sctp /bin/true
    install rds /bin/true
    install tipc /bin/true
  '';

  security = {
    protectKernelImage = true;
    rtkit = {
      enable = true;
    };
    sudo = {
      execWheelOnly = true;
    };
  };

  services = {
    dbus = {
      enable = true;
      implementation = "broker";
    };

    journald = {
      extraConfig = ''
        SystemMaxUse=500M
        SystemMaxFileSize=50M
      '';
      storage = "volatile";
      upload = {
        enable = false;
      };
    };
  };

  services.sysstat.enable = true;

}
