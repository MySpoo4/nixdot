{ pkgs, ... }:
let
  theme = (import ../../colorscheme/default.nix).theme;
in
{
  home.packages = with pkgs; [eww-wayland];
  xdg.configFile = {
    "eww/eww.yuck" = {
      source = ../../../dotfiles/eww;
      recursive = true;
    };
    # Put color scheme here and @use in scss files
    "eww/_theme.scss" = {
      text = ''
      '';
    };
  };
}
