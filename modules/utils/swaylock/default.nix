{ pkgs, lib, ... }:
let
  theme = (import ../../colorscheme/default.nix).theme;
in
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };

  xdg.configFile = {
    "swaylock/config".text = with theme.scheme.colors; ''
      ${lib.fileContents ../../../dotfiles/swaylock/config}
      color=00000000
      line-color=${bg}
      ring-color=${altbg}
      inside-color=${bg}
      key-hl-color=${primary}
      separator-color=00000000
      text-color=${fg}
      text-caps-lock-color=""
      line-ver-color=${primary}
      ring-ver-color=${primary}
      inside-ver-color=${bg}
      text-ver-color=${fg}
      ring-wrong-color=${red}
      text-wrong-color=${red}
      inside-wrong-color=${bg}
      inside-clear-color=${bg}
      text-clear-color=${fg}
      ring-clear-color=${cyan}
      line-clear-color=${bg}
      line-wrong-color=${bg}
      bs-hl-color=${primary}
    '';
  };

}
