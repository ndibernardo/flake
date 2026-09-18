{
  lib,
  vimUtils,
  fetchFromGitHub,
}:

vimUtils.buildVimPlugin {
  name = "tairiki";

  src = fetchFromGitHub {
    owner = "deparr";
    repo = "tairiki.nvim";
    rev = "7dd9a81f96280cfd4789582c7165787b456f1577";
    hash = "sha256-FRqBpvC3XyO677rtKbBOJL2kanIM6sdv9UqjZSyxkqw=";
  };

  meta = {
    description = "Dark Theme for neovim >= 0.8 based on Tomorrow Night.";
    homepage = "https://github.com/deparr/tairiki.nvim";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
  };
}
