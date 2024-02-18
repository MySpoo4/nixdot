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
    # theme = with theme.scheme.colors; {
    #
    #   "*" = {
    #     bg0 = mkLiteral bg;
    #     bg1 = mkLiteral altbg;
    #     fg0 = mkLiteral fg;
    #
    #     accent-color = mkLiteral primary;
    #     urgent-color = mkLiteral red;
    #     
    #     background-color = mkLiteral "transparent";
    #     text-color = mkLiteral "@fg0";
    #
    #     margin = 0;
    #     padding = 0;
    #     spacing = 0;
    #   };
    #
    #   window = {
    #     location = mkLiteral "center";
    #     width = 480;
    #     background-color = mkLiteral "@bg0";
    #   };
    #
    #   inputbar = {
    #     spacing = mkLiteral "8px";
    #     padding = mkLiteral "8px";
    #
    #     background-color = mkLiteral "@bg1";
    #   };
    #
    #   "prompt, entry, element-icon, element-text" = {
    #     vertical-align = mkLiteral "0.5";
    #   };
    #
    #   prompt = {
    #     text-color = mkLiteral "@accent-color";
    #   };
    #
    #   textbox = {
    #     padding = mkLiteral "8px";
    #     background-color = mkLiteral "@bg1";
    #   };
    #
    #   listview = {
    #     padding = mkLiteral "4px 0";
    #     lines = 8;
    #     columns = 1;
    #     fixed-height = true;
    #   };
    #
    #   element = {
    #     padding = mkLiteral "8px";
    #     spacing = mkLiteral "8px";
    #   };
    #
    #   "element normal normal" = {
    #     text-color = mkLiteral "@fg0";
    #   };
    #
    #   "element normal urgent" = {
    #     text-color = mkLiteral "@urgent-color";
    #   };
    #
    #   "element normal active" = {
    #     text-color = mkLiteral "@accent-color";
    #   };
    #
    #   "element selected" = {
    #     text-color = mkLiteral "@bg0";
    #   };
    #
    #   "element selected normal, element selected active" = {
    #     background-color = mkLiteral "@accent-color";
    #   };
    #
    #   "element selected urgent" = {
    #     background-color = mkLiteral "@urgent-color";
    #   };
    #
    #   element-icon = {
    #     size = mkLiteral "1em";
    #   };
    #
    #   element-text = {
    #     text-color = mkLiteral "inherit";
    #   };
    # };
}
