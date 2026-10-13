{ inputs, pkgs, ... }:
{
  programs.claude-code.enable = true;

  home.packages = with pkgs; [
    nodejs_24
  ];
}
