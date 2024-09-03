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

    zellij = {
      url = "github:zellij-org/zellij/240a53aa1aab6b3b58c385bccda6170606c46790";
      # url = "github:zellij-org/zellij";
      flake = false;
    };

    termusic = {
      url = "github:tramhao/termusic/8ba411e00db4aca80f55305614db0c14c372";
      flake = false;
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
