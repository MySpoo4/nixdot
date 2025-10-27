{ inputs, ... }:
inputs.nixpkgs.lib.nixosSystem {
  #   inherit system;
  # specialArgs = {
  #   inherit inputs system vars;
  #   host = {
  #     hostName = "null";
  #   };
  # };

  modules = [
    ./configuration.nix
    # ./packages.nix
    # ./home.nix
    # ../hosts/null
  ];
}
