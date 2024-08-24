{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    cargo
    rustc

    qbittorrent
    obs-studio
    zoom-us
    obsidian

    libnotify

  ];
}
