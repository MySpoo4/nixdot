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
      inputs.nixpkgs.follows = "nixpkgs";
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
      # vars = {
      #   user = "rwan";
      #   terminal = "kitty";
      #   editor = "nvim";
      # };
      # overlays = import ./overlays { inherit inputs; };
    in
    {
      nixosConfigurations = (
        import ./core {
          inherit (nixpkgs) lib;
          inherit
            inputs
            nixpkgs
            home-manager
            # vars
            # overlays
            ;
        }
      );

      templates = import ./shells/shells.nix;
    };
}
