{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  hyprland = inputs.hyprland.packages."${pkgs.system}".hyprland;
  theme = (import ../../../colorscheme/default.nix).theme;
  inherit (lib.strings) removePrefix;
in
{

  home.packages = with pkgs; [
    hyprlock
    hypridle
    # hyprwayland-scanner
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland;
    systemd.enable = true;
    xwayland.enable = true;

    extraConfig = ''
      # Place holder (config loaded below)
    '';
  };

  xdg.configFile = {
    hypr = {
      source = ../../../../dotfiles/hypr;
      recursive = true;
    };

    "hypr/configs/colorscheme.conf".text = with theme.scheme.colors; ''
      $primary = rgba(${removePrefix "#" primary}ff)
      $bg = rgba(${removePrefix "#" bg}ff)
      $bg1 = rgba(${removePrefix "#" bg1}ff)
      $fg = rgba(${removePrefix "#" fg1}ff)
      $fg1 = rgba(${removePrefix "#" fg}ff)
      $black = rgba(${removePrefix "#" black}ff)
      $black1 = rgba(${removePrefix "#" black1}ff)
      $grey = rgba(${removePrefix "#" grey}ff)
      $grey1 = rgba(${removePrefix "#" grey1}ff)
      $grey2 = rgba(${removePrefix "#" grey2}ff)
      $white = rgba(${removePrefix "#" white}ff)
      $red = rgba(${removePrefix "#" red}ff)
      $orange = rgba(${removePrefix "#" orange}ff)
      $green = rgba(${removePrefix "#" green}ff)
      $yellow = rgba(${removePrefix "#" yellow}ff)
      $cyan = rgba(${removePrefix "#" cyan}ff)
      $blue = rgba(${removePrefix "#" blue}ff)
      $magenta = rgba(${removePrefix "#" magenta}ff)
    '';
  };
}
