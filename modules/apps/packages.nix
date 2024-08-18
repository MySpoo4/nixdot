{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libnotify
    obs-studio
  ];
}
