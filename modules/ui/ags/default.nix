{ inputs, pkgs, ... }:
{
  imports = [ 
    inputs.ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = true;
    
    # # packages to add to gjs's runtime
    # extraPackages = [
    # ];
  };

  xdg.configFile = {
    ags = {
      source = ../../../dotfiles/ags;
      recursive = true;
    };
  };
}
