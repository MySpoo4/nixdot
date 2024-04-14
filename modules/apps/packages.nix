{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libnotify
    font-manager
    obs-studio
  ];
}
