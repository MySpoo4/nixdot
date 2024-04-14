{ pkgs, ... }:
{
  home.packages = with pkgs; [
    swww
  ];

  xdg.configFile = {
    swww = {
      source = ../../../walls;
      recursive = true;
    };
  };
}
