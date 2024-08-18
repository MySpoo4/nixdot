{ inputs, pkgs, ... }:
let
  theme = (import ../../../colorscheme/default.nix).theme;
in
{
  imports = [ inputs.ags.homeManagerModules.default ];
  programs.ags.enable = true;

  home.packages = with pkgs; [
    bun
    sassc
    gtk3
    brightnessctl
    wl-clipboard
  ];

  xdg.configFile = {
    ags = {
      source = ../../../../dotfiles/ags;
      recursive = true;
    };

    "ags/styles/theme.scss".text = with theme.scheme.colors; ''
      $primary: ${primary};
      $bg: ${bg};
      $bg1: ${bg1};
      $fg: ${fg};
      $fg1: ${fg1};
      $black: ${black};
      $black1: ${black1};
      $grey: ${grey};
      $grey1: ${grey1};
      $grey2: ${grey2};
      $white: ${white};
      $red: ${red};
      $orange: ${orange};
      $yellow: ${yellow};
      $green: ${green};
      $cyan: ${cyan};
      $blue: ${blue};
      $magenta: ${magenta};
    '';
  };
}
