{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # terminal stuff
    neovim
    kitty
    git

    # files
    unzip
    zip

    # utilities
    wget
    curl
    ripgrep
    fd
    fzf
    killall
    bluetuith
    google-chrome
  ];
}
