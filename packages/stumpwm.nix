{
  stumpwm,
  sbcl,
  autoreconfHook,
  lib,
  libfixposix,
  makeWrapper,
  texinfo,
  stumpwm-contrib,
}:

stumpwm.overrideAttrs (old: {
  nativeBuildInputs = [
    autoreconfHook
    makeWrapper
    (sbcl.withPackages (
      ps: with ps; [
        alexandria
        cl-ppcre
        clx
        clx-truetype
        fiasco
        swank
        xembed
        dbus
        xml-emitter
        bordeaux-threads
      ]
    ))
    texinfo
  ];

  postConfigure = (old.postConfigure or "") + ''
    # ASDF needs a writable cache for contrib sources in the Nix store.
    export HOME=$(pwd)

    cat >> load-stumpwm.lisp <<'LISP'
    (asdf:load-system "swank")

    (asdf:load-asd #p"${stumpwm-contrib}/util/ttf-fonts/ttf-fonts.asd")
    (asdf:load-system "ttf-fonts")

    (asdf:load-asd #p"${stumpwm-contrib}/util/swm-gaps/swm-gaps.asd")
    (asdf:load-system "swm-gaps")

    (asdf:load-asd #p"${stumpwm-contrib}/modeline/cpu/cpu.asd")
    (asdf:load-system "cpu")
    (asdf:load-asd #p"${stumpwm-contrib}/modeline/mem/mem.asd")
    (asdf:load-system "mem")

    (asdf:load-asd #p"${stumpwm-contrib}/modeline/stumptray/stumptray.asd")
    (asdf:load-system "stumptray")
    (asdf:load-asd #p"${stumpwm-contrib}/util/notify/notify.asd")
    (asdf:load-system "notify")

    (asdf:load-asd #p"${stumpwm-contrib}/util/winner-mode/winner-mode.asd")
    (asdf:load-system "winner-mode")
    (asdf:load-asd #p"${stumpwm-contrib}/util/globalwindows/globalwindows.asd")
    (asdf:load-system "globalwindows")
    LISP
  '';

  postInstall = (old.postInstall or "") + ''
    wrapProgram $out/bin/stumpwm \
      --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [ libfixposix ]}
  '';
})
