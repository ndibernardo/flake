{
  lib,
  requireFile,
  stdenvNoCC,
  unzip,
  nerd-font-patcher,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "berkeley-mono";
  version = "2.004";

  src = requireFile {
    name = "26091623PWV3QQ0R.zip";
    hash = "sha256-UXWiHSC6nybnKnghZf+quGlkWCmi6jiiXMOcJomBI9I=";
    message = ''
      Berkeley Mono is a licensed font and must be added to the Nix store
      manually. With the downloaded archive in this repository, run:

        nix store add-file assets/26091623PWV3QQ0R.zip
    '';
  };

  nativeBuildInputs = [
    unzip
    nerd-font-patcher
  ];

  unpackPhase = ''
    runHook preUnpack
    unzip "$src"
    runHook postUnpack
  '';

  buildPhase = ''
    runHook preBuild
    mkdir -p patched
    while IFS= read -r -d $'\0' font; do
      echo "Patching $font..."
      nerd-font-patcher \
        --complete \
        --careful \
        --makegroups -1 \
        --outputdir patched \
        "$font"
    done < <(find . -name '*.ttf' -print0)
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    install -d "$out/share/fonts/truetype"
    find patched -name '*.ttf' -exec install -m644 -t "$out/share/fonts/truetype" {} +
    runHook postInstall
  '';

  meta = {
    description = "Berkeley Mono typeface with Nerd Font glyphs";
    homepage = "https://berkeleygraphics.com/typefaces/berkeley-mono";
    license = lib.licenses.unfree;
    platforms = lib.platforms.all;
  };
})
