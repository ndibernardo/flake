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
machines/               per-machine configuration
machines/daedalus/      desktop workstation (AMD Ryzen 9 9950X3D, NVIDIA GeForce RTX 5080)
modules/                NixOS and home-manager modules, grouped by category then per-tool
modules/core/           system-level: hardware, security, networking, package manager
modules/desktop/        window manager, session
modules/applications/   primary end-user programs
modules/tools/          cli dev tooling
packages/               custom package definitions not in nixpkgs
parts/                  flake-parts lib: checks, devshell, machines, packages, templates
templates/              per-language dev environment flakes
```

`import-tree` recursively imports all Nix modules from `modules/` and `parts/`.

Every module under `modules/` is imported on every machine and declares a single
`<group>.<name>.enable` option, so a machine states what it wants rather than
subtracting from a default:

```nix
machines.daedalus.config = {
  core.docker.enable = true;
  desktop.labwc.enable = true;
  applications.emacs.enable = true;
};
```

Packages that need no configuration go in `extraPackages` on the machine.
`make check` builds every machine and verifies formatting.

## Templates

Initialize a dev environment in a new project directory:

```
nix flake init -t github:ndibernardo/flake#<template>
```

direnv and nix-direnv load the dev shell automatically, giving each project an isolated environment.
