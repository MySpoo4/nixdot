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
    extraSpecialArgs = { inherit inputs; inherit vars; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${vars.user} = {
      imports = (
        import ../modules/editors ++
        import ../modules/system  ++
        import ../modules/ui ++
        import ../modules/programs ++
        import ../modules/shell ++
        import ../modules/utils
      );
      home.homeDirectory = "/home/${vars.user}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };
}
