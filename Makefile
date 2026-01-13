FLAKE_NAME := $(or $(FLAKE_NAME), $(shell hostname))
UNAME := $(shell uname)

ifeq ($(UNAME), Darwin)
	REBUILD_CMD := darwin-rebuild
	DARWIN_REBUILD_EXISTS := $(shell command -v darwin-rebuild 2> /dev/null)
else
	REBUILD_CMD := nixos-rebuild
endif

.PHONY: default
default: update switch

.PHONY: switch
switch:
ifeq ($(UNAME), Darwin)
ifeq ($(DARWIN_REBUILD_EXISTS),)
	@echo "darwin-rebuild not found, bootstrapping..."
	nix build --extra-experimental-features nix-command --extra-experimental-features flakes .#darwinConfigurations.$(FLAKE_NAME).system
	sudo ./result/sw/bin/darwin-rebuild switch --flake ".#$(FLAKE_NAME)"
else
	sudo $(REBUILD_CMD) switch --flake ".#$(FLAKE_NAME)"
endif
else
	sudo $(REBUILD_CMD) switch --flake ".#$(FLAKE_NAME)"
endif

.PHONY: update
update:
	nix --extra-experimental-features nix-command --extra-experimental-features flakes flake update

.PHONY: diff
diff:
	nix store diff-closures /run/booted-system /run/current-system
