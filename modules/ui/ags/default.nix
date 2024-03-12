{ inputs, pkgs, ... }:
let
  theme = (import ../../colorscheme/default.nix).theme;
in
{
  imports = [ inputs.ags.homeManagerModules.default ];
  home.packages = with pkgs; [
    bun
    sassc
  ];

  programs.ags = {
    enable = true;
  };

  xdg.configFile = {
    ags = {
      source = ../../../dotfiles/ags;
      recursive = true;
    };

    "ags/styles/theme.scss".text = with theme.scheme.colors; ''
      $primary: ${primary};
      $bg: ${bg};
      $altbg: ${altbg};
      $fg: ${fg};
      $altfg: ${altfg};
      $black: ${black};
      $red: ${red};
      $altred: ${altred};
      $orange: ${orange};
      $yellow: ${yellow};
      $green: ${green};
      $cyan: ${cyan};
      $blue: ${blue};
      $altblue: ${altblue};
      $magenta: ${magenta};
      $white: ${white};
    '';
  };
}
