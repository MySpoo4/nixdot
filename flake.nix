{
  description = "My personal config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # Unstable Nix Packages

    home-manager = {
      # User Environment Manager
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      # Official Hyprland Flake
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      # url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ags-nix = {
    #   url = "github:nixos/nixpkgs?ref=nixos-24.11";
    # };

    ags = {
      url = "github:aylur/ags";
      # url = "github:aylur/ags/bb91f7c8fdd2f51c79d3af3f2881cacbdff19f60";
      # inputs.nixpkgs.follows = "ags-nix";
      # flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-hardware,
      home-manager,
      ...
    }@inputs:
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
          inherit
            inputs
            nixpkgs
            home-manager
            vars
            overlays
            ;
        }
      );

      templates = import ./shells/shells.nix;
    };
}
