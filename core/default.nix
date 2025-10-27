{
  inputs,
  ...
}:
let
  corePath = ../core;

  hosts = builtins.attrValues (builtins.readDir ../hosts);
  mkHost =
    name:
    import (../hosts + "/${name}") {
      inherit inputs corePath;
    };
in
# Dynamically add all hosts
builtins.listToAttrs (
  map (host: {
    name = host;
    value = mkHost host;
  }) hosts
)
