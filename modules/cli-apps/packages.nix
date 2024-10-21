{ pkgs, ... }:
{
  home.packages = with pkgs; [
    sshfs # edit files over ssh
    bluetuith     # bluetooth
    protonvpn-cli_2
  ];
}
