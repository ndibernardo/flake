# Nicola's Nix Configuration Flake

## Make Commands

This flake includes a Makefile with commands for managing my Nix systems:

### `make` (default)
Runs both `update` and `switch` commands in sequence.

```bash
make
```

### `make update`
Updates all flake inputs to their latest versions.

```bash
make update
```

### `make switch`
Rebuilds and switches the NixOS configuration using the flake. By default, it uses the hostname as the flake name.

```bash
make switch
```

To use a specific configuration:

```bash
FLAKE_NAME=nixos make switch
```

## Development Environment Templates

This flake provides ready-to-use development environment templates for various languages. All templates are designed with direnv integration in mind for automatic environment activation:

- **clojure** 
- **elixir** 
- **java**
- **nix** 
- **rust**
- **scala**
- **zig**
- **zig-master**

### Initializing a Template

To initialize a template in a new project, use the `nix flake init` command:

#### Example: Scala Template

```bash
nix flake init -t github:ndibernardo/flake#scala
```

Allow direnv:
```bash
direnv allow
```
