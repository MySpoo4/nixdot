{
  lib,
  config,
  inputs,
  ...
}:
let
  usersDir = config.systemModules.home-manager.usersDir;

  # dotfiles path
  dotfiles = inputs.self + /dotfiles;
  # home-manager modules
  homeModules = import (inputs.self + /modules/home);

  # Get only .nix files in the directory
  userNames = builtins.attrNames (builtins.readDir usersDir);

  # Import each user file
  mkUser = file: import (usersDir + "/${file}");
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  options.systemModules.home-manager = {
    usersDir = lib.mkOption {
      type = lib.types.path;
      description = "Path to users directory";
    };
  };

  config.home-manager = {
    extraSpecialArgs = { inherit inputs dotfiles homeModules; };
    useGlobalPkgs = true;
    useUserPackages = true;

    users = builtins.listToAttrs (
      map (file: {
        name = lib.removeSuffix ".nix" file; # optional
        value = mkUser file;
      }) userNames
    );

    sharedModules = [
      (inputs.self + /modules/theme/theme.nix)
    ];
  };
}
