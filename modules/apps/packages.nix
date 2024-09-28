{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    cargo
    rustc
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
