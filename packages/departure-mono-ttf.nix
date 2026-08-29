{
  departure-mono,
  fontforge,
  runCommandLocal,
}:

runCommandLocal "departure-mono-ttf-${departure-mono.version}"
  {
    nativeBuildInputs = [ fontforge ];
    inherit (departure-mono) meta;
  }
  ''
    mkdir -p $out/share/fonts/truetype
    for otf in ${departure-mono}/share/fonts/otf/*.otf; do
      fontforge -lang=ff -c 'Open($1); Generate($2)' \
        "$otf" "$out/share/fonts/truetype/$(basename "$otf" .otf).ttf"
    done
  ''
