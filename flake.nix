{
  description = "My personal config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";         # Unstable Nix Packages
    # remove this later on
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

    ags-nix = {
      url = "github:nixos/nixpkgs?ref=nixos-24.11";
    };

    ags = {
      # url = "github:aylur/ags";
      url = "github:aylur/ags/bb91f7c8fdd2f51c79d3af3f2881cacbdff19f60";
      inputs.nixpkgs.follows = "ags-nix";
      # flake = false;
    };
    
    # astal = {
    #   url = "github:aylur/astal";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # zellij = {
    #   url = "github:zellij-org/zellij/4ac7d0865891ac06d10b9a45d467249f105bd29e";
    #   # url = "github:zellij-org/zellij";
    #   flake = false;
    # };
    #
    # termusic = {
    #   url = "github:tramhao/termusic/8ba411e00db4aca80f55305614db0c14c372";
    #   flake = false;
    # };
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
    overlays = import ./overlays { inherit inputs; };
  in
  {
    nixosConfigurations = (
      import ./core {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs home-manager vars overlays;
        inherit nixos-hardware;
      }
    );

    templates = import ./shells/shells.nix;
  };
}
