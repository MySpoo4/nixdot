{
  inputs,
  systemModules,
  ...
}:
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit inputs systemModules;
  };

  modules = [
    ./configuration.nix
    ./hardware-configuration.nix
  ];
}
