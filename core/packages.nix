{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # terminal
    git           # Version Control
    neovim        # Text Editor
    wget          # Retriever
    nix-tree      # Browse Nix Store
    kitty

    # Video / Audio
    alsa-utils
    mpv
    pipewire
    pulseaudio

    # Apps
    firefox

    # File Management
    unzip
    zip
    unrar

    # Utilities
    ripgrep
    fd
    gcc

    # # system
    # xdg-utils
    # xdg-user-dirs
    gtk-layer-shell
    gtk3
    #
    # # apps
    # qbittorrent
    # discord
    # bitwarden
    # obs-studio
    # # zoom-us
    #
    # # utilities
    # git
    # jq
    # curl
    # ripgrep
    # fd
    # fzf
    # ghq
    # gh
    # gnumake
    # gcc
    # cmake
    # libtool
    # lsof
    # killall
    # efibootmgr
    # unzip
    # zip
    # unar
    #
    # # services
    # udiskie
    # libnotify
    # inotify-tools
    # 
    # # media
    # pavucontrol
    # ffmpeg
  ];
}
