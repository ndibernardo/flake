{ ... }:
{
  flake.nixosModules.nixpkgs = (
    { ... }:
    {
      nixpkgs = {
        config.allowUnfree = true;
        overlays = [
          (final: prev: {
            solaar = prev.solaar.overrideAttrs (_: {
              version = "1.1.20";
              src = final.fetchFromGitHub {
                owner = "pwr-Solaar";
                repo = "Solaar";
                tag = final.solaar.version;
                hash = "sha256-h/uiy0TtMicKch2cdXHur5DkvQun2sAw2HpFI7Qstqg=";
              };
            });
            berkeley-mono = final.callPackage ../../packages/berkeley-mono.nix { };
            pragmata-pro = final.callPackage ../../packages/pragmata-pro.nix { };
            musicplayer = final.callPackage ../../packages/musicplayer.nix { };
          })
        ];
      };
    }
  );
}
