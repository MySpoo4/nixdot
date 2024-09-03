{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    cargo
    rustc

    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      pip
      dbus-python
    ]))

    networkmanagerapplet
    
    qbittorrent
    obs-studio
    zoom-us
    obsidian

    libnotify

  ];
}
