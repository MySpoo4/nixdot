{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    rustup

    networkmanagerapplet
    
    qbittorrent
    obs-studio
    zoom-us
    obsidian
    grimblast
    mpv

    libnotify

  ];
}
