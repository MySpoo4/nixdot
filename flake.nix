{
  description = "NixOS Config";

  inputs = {
    # follow unstable pkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # User Environment Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # TODO check if this is still default
    niri = {
      url = "github:sodiboo/niri-flake";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    codex = {
      url = "github:sadjow/codex-cli-nix";
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-hardware,
      ...
    }@inputs:
    {
      nixosConfigurations = import ./hosts {
        inherit (nixpkgs) lib;
        inherit inputs;
      };

      templates = import ./shells/shells.nix;
    };
}
