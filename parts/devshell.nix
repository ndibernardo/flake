{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          gnumake
          lua-language-server
          nixd
          nixfmt
        ];
      };
    };
}
