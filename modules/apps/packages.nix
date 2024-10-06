{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs

    networkmanagerapplet
    
    qbittorrent
    obs-studio
    zoom-us
    obsidian
    grimblast
    mpv
    alacritty

    libnotify

  ];
}
