{ ... }:
{
  security = {
    protectKernelImage = true;
    audit = {
      enable = true;
      rules = [
        "-a exit,always -F arch=b64 -S execve"
      ];
    };
    auditd = {
      enable = true;
    };
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

    logrotate = {
      enable = true;
    };
  };

}
