{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    python3
    rustup

    networkmanagerapplet
    
    qbittorrent
    obs-studio
    zoom-us
    slack
    obsidian
    grimblast
    mpv
    mcomix

    libnotify
    google-chrome

    # sbu courses
    R
  ];
}
