{ pkgs, lib, ... }:
let
  theme = (import ../../colorscheme/default.nix).theme;
in
{
  programs.waybar = {
    enable = true;
  };
}
