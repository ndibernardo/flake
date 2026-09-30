{
  melpaBuild,
  fetchFromGitHub,
  hel,
  vterm,
}:

melpaBuild {
  pname = "hel-vterm";
  version = "0.10.0";

  src = fetchFromGitHub {
    owner = "helheim-emacs";
    repo = "hel-vterm";
    rev = "733a5fa38d79cdddb0e9fc45cf784e541a35f14b";
    hash = "sha256-KaJRjzQtocv7j12rlWq4fUFSO5bdvWdnnlPApe7+zv4=";
  };

  packageRequires = [
    hel
    vterm
  ];
}
