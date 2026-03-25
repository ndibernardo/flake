{ ... }:
{
  flake.nixosModules.packages = (
    { pkgs, ... }:
    {
      nixpkgs = {
        config.allowUnfree = true;
        overlays = [
          (final: _: {
            berkeley-mono = final.callPackage ../../packages/berkeley-mono.nix { };
          })
        ];
      };

      environment.systemPackages = with pkgs; [
        _1password-cli
        _1password-gui
        aide
        brave
        bemenu
        claude-code
        brightnessctl
        clamav
        curl
        docker-compose
        doublecmd
        fzf
        gcc
        git
        glib
        grim
        htop
        killall
        librewolf
        lutris
        lynis
        man-pages
        man-pages-posix
        nicotine-plus
        nixd
        nixfmt
        pavucontrol
        puddletag
        ripgrep
        slurp
        spek
        swaybg
        swayidle
        swaylock
        ungoogled-chromium
        unzip
        vim
        wget
        wl-clipboard
        xdg-utils
        thunar
        zip
      ];
    }
  );
}
