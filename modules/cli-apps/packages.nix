{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nix-prefetch-git # for getting hash
    sshfs # edit files over ssh
    bluetuith     # bluetooth
    tor
    protonvpn-cli_2
    lazygit
    geckodriver # webdriver
    chromedriver # webdriver
    websocat
  ];
}
