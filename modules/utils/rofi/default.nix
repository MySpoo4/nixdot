{ config, pkgs, ... }:
let
  theme = (import ../../colorscheme/default.nix).theme;
in
{
  home.packages = with pkgs; [
    papirus-icon-theme
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  home.file = {
    "${config.xdg.configHome}/rofi" = {
      source = ../../../dotfiles/rofi;
      recursive = true;
    };

    "${config.xdg.configHome}/rofi/colorscheme.rasi" = {
      text = with theme.scheme.colors; ''
        * {
          primary:    ${primary};
          bg:         ${bg};
          altbg:      ${altbg};
          fg:         ${fg};
          black:      ${black};
          red:        ${red};
          green:      ${green};
          yellow:     ${yellow};
          blue:       ${blue};
          magenta:    ${magenta};
          cyan:       ${cyan};
          white:      ${white};
        }
      '';
    };
  };
}
