{ config, lib, pkgs, inputs, ... }:
let
  theme = (import ../../colorscheme/default.nix).theme;
  inherit (lib.strings) removePrefix;
  colorscheme = with theme.scheme.colors; ''
      $primary = rgba(${removePrefix "#" primary}ff)
      $bg = rgba(${removePrefix "#" bg}ff)
      $altbg = rgba(${removePrefix "#" altbg}ff)
      $fg = rgba(${removePrefix "#" fg}ff)
      $black = rgba(${removePrefix "#" black}ff)
      $red = rgba(${removePrefix "#" red}ff)
      $green = rgba(${removePrefix "#" green}ff)
      $yellow = rgba(${removePrefix "#" yellow}ff)
      $blue = rgba(${removePrefix "#" blue}ff)
      $magenta = rgba(${removePrefix "#" magenta}ff)
      $cyan = rgba(${removePrefix "#" cyan}ff)
      $white = rgba(${removePrefix "#" white}ff)
  '';
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    extraConfig = ''
      ${colorscheme}
      ${lib.fileContents ../../../dotfiles/hypr/hyprland.conf}
    '';
  };
}
