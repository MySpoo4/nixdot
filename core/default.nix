{
  inputs,
  nixpkgs,
  nixos-hardware,
  home-manager,
  nur,
  hyprland,
  vars,
  ...
}:
let 
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;
in {
  temmi = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs system pkgs hyprland vars;
      host = {
        hostName = "temmi";
      };
    };

    modules = [
      ./configuration.nix
      ./packages.nix
      ./home.nix
      ../hosts/temmi
      nur.nixosModules.nur
    ];
  };
}
