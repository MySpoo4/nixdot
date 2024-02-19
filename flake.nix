{
  description = "My personal config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";         # Unstable Nix Packages
    nixos-hardware.url = "github:nixos/nixos-hardware";            # Hardware Specific Configurations

    home-manager = {                                                      # User Environment Manager
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {                                                               # NUR Community Packages
      url = "github:nix-community/NUR";                                   # Requires "nur.nixosModules.nur" to be added to the host modules
    };
    
    hyprland = {                                                          # Official Hyprland Flake
      url = "github:hyprwm/Hyprland";                                     # Requires "hyprland.nixosModules.default" to be added the host modules
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { 
    self, 
    nixpkgs, 
    nixos-hardware, 
    home-manager, 
    nur, 
    hyprland, 
    ... 
  } @ inputs:
  let
    vars = {
      user = "rwan";
      terminal = "kitty";
      editor = "nvim";
    };
    shells = (import ./shells/shells.nix) { inherit self; };
  in
  {
    nixosConfigurations = (
      import ./core {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs home-manager vars;
        inherit hyprland nixos-hardware nur;
      }
    );

    templates = {
      rust = {
        path = ./shells/rust;
        description = "test";
      };
    };
  };
}
