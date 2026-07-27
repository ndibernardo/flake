{ lib, ... }:
{
  flake.templates = import ../templates { inherit lib; };
}
