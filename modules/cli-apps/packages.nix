{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bluetuith     # bluetooth
  ];
}
