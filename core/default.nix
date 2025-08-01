{
  inputs,
  nixpkgs,
  home-manager,
  vars,
  overlays,
  ...
}:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    overlays = [ overlays.modifications ];
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;
in
{
  null = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs system vars;
      host = {
        hostName = "null";
      };
    };

    modules = [
      ./configuration.nix
      ./packages.nix
      ./home.nix
      ../hosts/null
    ];
  };
}
