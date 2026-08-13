HOST ?= daedalus
SYSTEM_ATTR := .\#nixosConfigurations.$(HOST).config.system.build.toplevel
RESULT := $(CURDIR)/result

export NIX_CONFIG := extra-experimental-features = pipe-operators

.DEFAULT_GOAL := preflight
.NOTPARALLEL:

.PHONY: check
check:
	nix flake check --no-build --no-update-lock-file

.PHONY: build
build:
	nix build --no-update-lock-file --out-link "$(RESULT)" "$(SYSTEM_ATTR)"

.PHONY: preflight
preflight: check build

.PHONY: full-check
full-check:
	nix flake check --no-update-lock-file

.PHONY: diff
diff: build
	@test -e /run/current-system || { echo '/run/current-system is unavailable; diff requires NixOS.' >&2; exit 1; }
	nix store diff-closures /run/current-system "$$(readlink -f "$(RESULT)")"

.PHONY: dry-activate
dry-activate: build
	@test -e /run/current-system || { echo '/run/current-system is unavailable; activation requires NixOS.' >&2; exit 1; }
	sudo nixos-rebuild dry-activate --no-reexec \
	  --store-path "$$(readlink -f "$(RESULT)")"

.PHONY: test
test: preflight
	@test "$(CONFIRM)" = test || { \
	  echo 'Refusing temporary activation. Re-run with: make test CONFIRM=test' >&2; \
	  exit 1; \
	}
	sudo nixos-rebuild test --no-reexec \
	  --store-path "$$(readlink -f "$(RESULT)")"

.PHONY: boot
boot: preflight
	@test "$(CONFIRM)" = boot || { \
	  echo 'Refusing boot-default change. Re-run with: make boot CONFIRM=boot' >&2; \
	  exit 1; \
	}
	sudo nixos-rebuild boot --no-reexec \
	  --store-path "$$(readlink -f "$(RESULT)")"

.PHONY: switch promote
switch promote:
	@test "$(CONFIRM)" = switch || { \
	  echo 'Refusing promotion. First run make test CONFIRM=test, verify the system,' >&2; \
	  echo 'then re-run with: make switch CONFIRM=switch' >&2; \
	  exit 1; \
	}
	@test -L "$(RESULT)" || { echo 'No candidate result; run make test CONFIRM=test first.' >&2; exit 1; }
	@candidate="$$(readlink -f "$(RESULT)")"; \
	 current="$$(readlink -f /run/current-system)"; \
	 test "$$candidate" = "$$current" || { \
	   echo "Refusing promotion: candidate $$candidate is not the active tested system $$current" >&2; \
	   exit 1; \
	 }
	sudo nixos-rebuild switch --no-reexec \
	  --store-path "$$(readlink -f "$(RESULT)")"

.PHONY: update
update:
	nix flake update

.PHONY: generations rollback restore-booted
generations:
	nixos-rebuild list-generations

rollback:
	@test "$(CONFIRM)" = rollback || { \
	  echo 'Refusing rollback. Re-run with: make rollback CONFIRM=rollback' >&2; \
	  exit 1; \
	}
	sudo nixos-rebuild switch --rollback

restore-booted:
	@test "$(CONFIRM)" = restore-booted || { \
	  echo 'Refusing restore. Re-run with: make restore-booted CONFIRM=restore-booted' >&2; \
	  exit 1; \
	}
	sudo nixos-rebuild switch --no-reexec \
	  --store-path "$$(readlink -f /run/booted-system)"
