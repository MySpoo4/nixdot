{ pkgs, lib, ... }:
let
  theme = (import ../colorscheme/default.nix).theme;
  gtk-theme = theme.gtk-theme;
in
{
  home = {
    pointerCursor = lib.mkMerge [
      {
        name = theme.cursor.name;
        gtk.enable = true;
      }
      (lib.mkIf (theme.cursor.extra) {
        package = pkgs."${theme.cursor.package}"."${theme.cursor.accent}";
      })
      (lib.mkIf (!theme.cursor.extra) {
        package = pkgs."${theme.cursor.package}";
      })
    ];

    sessionVariables = {
      XCURSOR_THEME = theme.cursor.name;
      XCURSOR_SIZE = theme.cursor.size;
    };
  };

  gtk = {
    enable = true;

    theme = lib.mkMerge [
      {
        name = gtk-theme.name;
      }
      (lib.mkIf (gtk-theme.override) {
        package = pkgs."${gtk-theme.package}".override(gtk-theme.attr);
      })
      (lib.mkIf (!gtk-theme.override) {
        package = pkgs."${gtk-theme.package}";
      })
    ];

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = "Inter";
      size = 10;
    };
    
    cursorTheme = lib.mkMerge [
      {
        name = theme.cursor.name;
        size = theme.cursor.size;
      }
      (lib.mkIf (theme.cursor.extra) {
        package = pkgs."${theme.cursor.package}"."${theme.cursor.accent}";
      })
      (lib.mkIf (!theme.cursor.extra) {
        package = pkgs."${theme.cursor.package}";
      })
    ];

  };

}
# 
#󱐋
#󰤟

