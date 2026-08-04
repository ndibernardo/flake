FLAKE_NAME := $(or $(FLAKE_NAME), $(shell hostname))

export NIX_CONFIG := extra-experimental-features = pipe-operators

.PHONY: default
default: update switch

.PHONY: switch
switch:
	sudo nixos-rebuild switch --flake ".#$(FLAKE_NAME)"

.PHONY: switch-detached
switch-detached:
	systemd-run --user --scope --collect --quiet -- \
	  sudo nixos-rebuild switch --flake ".#$(FLAKE_NAME)"

.PHONY: update
update:
	nix flake update

.PHONY: check
check:
	nix flake check

.PHONY: diff
diff:
	nix store diff-closures /run/booted-system /run/current-system
