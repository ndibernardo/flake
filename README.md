# NixOS configuration flake

## Build

```
make          # update inputs and switch
make switch   # switch without updating
make update   # update flake.lock only
make diff     # diff booted vs current system closure
```

`FLAKE_NAME` defaults to `hostname`. Override with `FLAKE_NAME=<name> make`.

## Structure

```
machines/          per-machine configuration
machines/nixos/    desktop workstation (AMD Ryzen 9 9950X3D, NVIDIA GeForce RTX 5080)
modules/           per-tool NixOS and home-manager modules
packages/          custom package definitions not in nixpkgs
parts/             flake-parts lib: devshell, machines, templates
templates/         per-language dev environment flakes
```

`import-tree` recursively imports all Nix modules from `modules/` and `parts/`.

## Templates

Initialize a dev environment in a new project directory:

```
nix flake init -t github:ndibernardo/flake#<template>
```

Available templates: `c`, `clojure`, `elixir`, `fsharp`, `go`, `java`, `nix`, `ocaml`, `rust`, `scala`, `zig`, `zig-master`.

direnv and nix-direnv load the dev shell automatically, giving each project an isolated environment.

## Tools

- [1Password](https://1password.com)
- [atuin](https://atuin.sh)
- [direnv](https://direnv.net)
- [Firefox](https://www.mozilla.org/firefox/)
- [fish](https://fishshell.com)
- [Ghostty](https://ghostty.org)
- [Neovim](https://neovim.io)
- [NixOS](https://nixos.org)
- [Sway](https://swaywm.org)
