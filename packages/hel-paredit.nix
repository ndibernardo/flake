{
  melpaBuild,
  fetchFromGitHub,
  dash,
  hel,
  paredit,
}:

melpaBuild {
  pname = "hel-paredit";
  version = "0.10.0";

  src = fetchFromGitHub {
    owner = "helheim-emacs";
    repo = "hel-paredit";
    rev = "0a00838256aef0b459a8f76a684b8e1dee755efc";
    hash = "sha256-CO+Yf+wT/Cym5I5WW24lIjhcva2r+6RAr2K+TeErqNk=";
  };

  packageRequires = [
    dash
    hel
    paredit
  ];
}
