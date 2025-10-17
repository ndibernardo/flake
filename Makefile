FLAKE_NAME := $(or $(FLAKE_NAME), $(shell hostname))

.PHONY: default
default: update switch

.PHONY: switch
switch:
	sudo nixos-rebuild switch --flake ".#${FLAKE_NAME}"

.PHONY: update
update:
	nix flake update
