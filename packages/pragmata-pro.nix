{
  lib,
  requireFile,
  stdenvNoCC,
  unzip,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "pragmata-pro";
  version = "0.903";

  src = requireFile rec {
    name = "PragmataPro-${finalAttrs.version}.zip";
    sha256 = "09vpzcalcg2dih98jhgw879glvsgg0gsxy9si7l0zm7ksklh013p";
    message = ''
      This file needs to be manually downloaded.

      Place the zip file in the Nix store by running:
      nix-prefetch-url --type sha256 file://\$PWD/${name}
    '';
  };

  outputs = [ "out" ];

  nativeBuildInputs = [
    unzip
  ];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    find . -name "*.ttf" -exec cp {} $out/share/fonts/truetype/ \;
  '';

  meta = {
    description = "PragmataPro Font Family";
    longDescription = "PragmataPro is a condensed monospaced font optimized for screen, designed to be the ideal font for coding, math and engineering.";
    homepage = "https://fsd.it/shop/fonts/pragmatapro/";
    license = lib.licenses.unfree;
    platforms = lib.platforms.all;
  };
})
