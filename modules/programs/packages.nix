{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brightnessctl
    font-manager
  ];
}
