{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  wrapGAppsHook4,
  makeDesktopItem,
  copyDesktopItems,
  gtk4,
  glib,
  pango,
  cairo,
  gdk-pixbuf,
  graphene,
  libadwaita,
  alsa-lib,
}:

rustPlatform.buildRustPackage {
  pname = "musicplayer";
  version = "0-unstable-2026-07-31";

  src = fetchFromGitHub {
    owner = "ndibernardo";
    repo = "musicplayer-rs";
    rev = "d0bb5edc39d78158943e82f9d1c44caf85fe6d1b";
    hash = "sha256-PWzFhbeuBxEzlRM9X1qssEK0h2u880JZpx2YhiZHZ3s=";
  };

  cargoHash = "sha256-4K+91dBLbFqDE8u1JmBd6PXMbjem5RovYPGYSOq/t78=";

  buildFeatures = [ "ui" ];

  nativeBuildInputs = [
    pkg-config
    wrapGAppsHook4
    copyDesktopItems
  ];

  buildInputs = [
    gtk4
    glib
    pango
    cairo
    gdk-pixbuf
    graphene
    libadwaita
    alsa-lib
  ];

  desktopItems = [
    (makeDesktopItem {
      name = "musicplayer";
      exec = "musicplayer-rs";
      desktopName = "Music Player";
      comment = "A personal, no-nonsense music player for Linux";
      categories = [
        "AudioVideo"
        "Audio"
        "Player"
      ];
    })
  ];

  meta = {
    description = "A personal, no-nonsense music player for Linux built with GTK4 and Rust";
    homepage = "https://github.com/ndibernardo/musicplayer-rs";
    license = lib.licenses.unfree;
    mainProgram = "musicplayer-rs";
    platforms = lib.platforms.linux;
  };
}
