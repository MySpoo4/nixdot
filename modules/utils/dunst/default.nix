{ pkgs, lib, ... }:
let
  theme = (import ../../colorscheme/default.nix).theme;
in
{
  home.packages = [ pkgs.libnotify ];
  services.dunst = {
    enable = true;
  };
  xdg.configFile = {
    dunst = {
      source = ../../../dotfiles/dunst;
      recursive = true;
    };

    "dunst/colorschemerc".text = with theme.scheme.colors; ''
      [global]
        frame_color = ${primary}

      [urgency_low]
        background = ${altbg}
        foreground = ${primary}
        frame_color = ${primary}
        timeout = 10

      [urgency_normal]
        background = ${altbg}
        foreground = ${primary}
        frame_color = ${primary}
        timeout = 10

      [urgency_critical]
        background = ${red}
        foreground = ${primary}
        frame_color = ${bg}
        timeout = 0
    '';
  };
}
