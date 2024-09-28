{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bluetuith     # bluetooth
    protonvpn-cli_2
  ];
}
