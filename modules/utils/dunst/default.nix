{ pkgs, lib, ... }:
let
  theme = (import ../../colorscheme/default.nix).theme;
in
{
  home.packages = with pkgs; [ 
    libnotify 
  ];

  services.dunst = {
    enable = true;
  };

  xdg.configFile = {
    "dunst/dunstrc".text = with theme.scheme.colors; ''
      ${lib.fileContents ../../../dotfiles/dunst/dunstrc}

      [global] frame_color = "${primary}"
        separator_color = frame

      [urgency_low]
        background = "${altbg}"
        foreground = "${primary}"
        frame_color = "${primary}"

      [urgency_normal]
        background = "${altbg}"
        foreground = "${primary}"
        frame_color = "${primary}"

      [urgency_critical]
        background = "${red}"
        foreground = "${primary}"
        frame_color = "${bg}"
    '';
  };
}
