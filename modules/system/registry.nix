{ shells, ... }:
let
  bob = shells;
in
{
  nix.registry = bob;
}
