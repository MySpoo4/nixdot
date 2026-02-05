{
  lib,
  inputs,
  ...
}:
let
  # system modules for configuration
  systemModules = import (inputs.self + /modules/system);

  hostsDir = ./.;
  allEntries = builtins.readDir hostsDir;

  # ignore the default.nix
  hostNames = builtins.attrNames (lib.filterAttrs (_: type: type == "directory") allEntries);

  mkHost =
    name:
    import (hostsDir + "/${name}") {
      inherit inputs systemModules;
    };
in
# Dynamically add all hosts
builtins.listToAttrs (
  map (host: {
    name = host;
    value = mkHost host;
  }) hostNames
)
