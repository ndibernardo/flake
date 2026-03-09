{
  lib,
  requireFile,
  stdenvNoCC,
  unzip,
  nerd-font-patcher,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "berkeley-mono";
  version = "2.003";
  ticket = "ZP3772X8";

  src = requireFile rec {
    name = "${finalAttrs.pname}-${finalAttrs.version}-${finalAttrs.ticket}.zip";
    sha256 = "1sirb71abxffmil8y1zxnl7jx3fwjslwvsi372m3jqmllmpycq9z";
    message = ''
      This file needs to be manually downloaded from the Berkeley Graphics
      site (https://berkeleygraphics.com/accounts). An email will be sent to
      get a download link.

      Download the zip file.

      Then run:
      nix-prefetch-url --type sha256 file://\$PWD/${name}
    '';
  };

  outputs = [ "out" ];

  nativeBuildInputs = [
    unzip
    nerd-font-patcher
  ];

  unpackPhase = ''
    unzip $src
  '';

  buildPhase = ''
    mkdir -p patched
    for font in $(find . -name "*.ttf"); do
      echo "Patching $font..."
      nerd-font-patcher --complete --careful --makegroups -1 --outputdir patched "$font" || true
    done
  '';

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    find patched -name "*.ttf" -exec cp {} $out/share/fonts/truetype/ \;
  '';

  meta = {
    description = "Berkeley Mono Typeface";
    longDescription = "Berkeley Mono™ is a love letter to the golden era of computing.
    The era that gave rise to a generation of people who celebrated automation and reveled
    in the joy of computing, when transistors replaced cogs, and machine-readable typefaces
    were developed, for when humans and machines truly interfaced on an unprecedented scale.
    It wears a UNIX T-shirt and aspires to be etched on control panels in black synthetic lacquer.
    It is Adrian Frutiger visits Bell Labs. It is Gene Kranz's command.
    It operates with calibrated precision and has a datasheet.
    Berkeley Mono is a typeface for professionals.";
    homepage = "https://berkeleygraphics.com/typefaces/berkeley-mono";
    license = lib.licenses.unfree;
    platforms = lib.platforms.all;
  };
})
