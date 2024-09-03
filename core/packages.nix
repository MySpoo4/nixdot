{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # terminal
    neovim        # Text Editor
    wget          # Retriever
    kitty

    xdg-utils
    gtk-layer-shell
    gtk3
    libappindicator-gtk3

    # File Management
    unzip
    zip
    unrar

    # utilities
    git
    git-lfs
    curl
    ripgrep
    fd
    fzf
    gnumake
    gcc
    cmake
    libtool
    killall

    # media
    ffmpeg
  ];
}
