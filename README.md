# NixOS configuration flake

## Build

```
make              # evaluate and build the public configuration
make check        # evaluate all flake outputs without building
make build        # build the selected NixOS system
make full-check   # build all checks, including formatting
make diff         # diff current vs candidate system closure
make dry-activate # show activation changes without applying them
make update       # update flake.lock explicitly
```

The default target never updates inputs, uses `sudo`, or activates the result.
`HOST` defaults to `daedalus`; override it with `HOST=<name> make`.

The same public build can be run without Make:

```
nix build --no-update-lock-file \
  .#nixosConfigurations.daedalus.config.system.build.toplevel
```

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

A machine's `config` is where it sets these options; its `nixosModules` list is
for raw NixOS modules that declare no options of their own, such as
`hardware.nix`.

`make full-check` builds every machine and verifies formatting.

## Private configuration

The public flake is standalone and builds with anonymous defaults. A separate
private flake can extend `base.nixosConfigurations.daedalus` and provide:

```
user.name           login and home-manager account (default: "user")
user.fullName       git author name (default: "User")
user.email          git author email (default: "user@localhost")
user.homeDirectory  home directory (default: /home/${user.name})
user.stateVersion   home-manager state version (default: "25.11")
user.sshKeys        authorized SSH public keys (default: [ ])
outputs             kanshi monitor layout (default: [ ])
```

The consumer's `flake.lock` pins the exact public revision. Private packages,
networking and encrypted secrets remain in the private flake.

`machines/daedalus/hardware.nix` contains machine-specific disk UUIDs,
filesystems, Secure Boot and hardware settings. Building it is safe; activating
it on different hardware is not. A different machine needs its own generated
`hardware.nix` and machine definition.

## Templates

Initialize a dev environment in a new project directory:

```
nix flake init -t github:ndibernardo/flake#<template>
```

direnv and nix-direnv load the dev shell automatically, giving each project an isolated environment.
