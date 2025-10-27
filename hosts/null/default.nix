{
  inputs,
  corePath,
  ...
}:
inputs.nixpkgs.lib.nixosSystem {
  #   inherit system;
  # specialArgs = {
  #   inherit inputs system vars;
  #   host = {
  #     hostName = "null";
  #   };
  # };

  modules = [
    # general configuration
    (corePath + /configuration.nix)
    # host specific configuration
    ./configuration.nix
  ];
}
