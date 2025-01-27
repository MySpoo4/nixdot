{
  pkgs,
  inputs,
  nixpkgs,
  vars,
  home-manager,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    extraSpecialArgs = { inherit inputs vars; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${vars.user} = {
      imports = [
        ../modules/default.nix
      ];
      home.homeDirectory = "/home/${vars.user}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };
}
