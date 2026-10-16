{
  lib,
  requireFile,
  stdenvNoCC,
  unzip,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "pragmata-pro";
  version = "0.903";

  src = requireFile {
    name = "${finalAttrs.pname}-${finalAttrs.version}.zip";
    hash = "sha256-dwQA6dTz1A/oiTr5rh94T2/60kH8QYkSjE08RhX7dyc=";
    message = ''
      PragmataPro is a licensed font and must be added to the Nix store
      manually. With the downloaded archive in this repository, run:

        nix store add-file assets/${finalAttrs.pname}-${finalAttrs.version}.zip
    '';
  };

  nativeBuildInputs = [ unzip ];

  unpackPhase = ''
    runHook preUnpack
    unzip "$src"
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    install -d "$out/share/fonts/truetype"
    find . -name '*.ttf' -exec install -m644 -t "$out/share/fonts/truetype" {} +
    runHook postInstall
  '';

  meta = {
    description = "PragmataPro typeface";
    homepage = "https://fsd.it/shop/fonts/pragmatapro";
    license = lib.licenses.unfree;
    platforms = lib.platforms.all;
  };
})
