{
  description = "My personal config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";         # Unstable Nix Packages
    nixos-hardware.url = "github:nixos/nixos-hardware";            # Hardware Specific Configurations

    home-manager = {                                                      # User Environment Manager
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    hyprland = {                                                          # Official Hyprland Flake
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      # url = "github:hyprwm/Hyprland";                                     # Requires "hyprland.nixosModules.default" to be added the host modules
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:Aylur/ags";
    };

  };

  outputs = { 
    self, 
    nixpkgs, 
    nixos-hardware, 
    home-manager, 
    ... 
  } @ inputs:
  let
    vars = {
      user = "rwan";
      terminal = "kitty";
      editor = "nvim";
    };
  in
  {
    nixosConfigurations = (
      import ./core {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs home-manager vars;
        inherit nixos-hardware;
      }
    );

    templates = import ./shells/shells.nix;
  };
}
