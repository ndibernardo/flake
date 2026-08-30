{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "stumpwm-contrib";
  version = "0-unstable-2026-05-30";

  src = fetchFromGitHub {
    owner = "stumpwm";
    repo = "stumpwm-contrib";
    rev = "f9bda5dd7c8854fc8ecd773ca6f8901650813cdf";
    hash = "sha256-k/iK4MKBmGXaWaJRQMJk1WfQ2mtpbe77B+JxwrlhqIg=";
  };

  dontConfigure = true;
  dontBuild = true;

  # Installed under share/ so `environment.pathsToLink` can expose it at
  # /run/current-system/sw/share/stumpwm-contrib, which init.lisp names directly.
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/stumpwm-contrib
    cp -r modeline minor-mode util $out/share/stumpwm-contrib/
    runHook postInstall
  '';

  meta = {
    description = "Contributed modules for StumpWM";
    homepage = "https://github.com/stumpwm/stumpwm-contrib";
    license = lib.licenses.gpl3Plus;
    platforms = lib.platforms.unix;
  };
}
