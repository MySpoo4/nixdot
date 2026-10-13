{ inputs, pkgs, ... }:
{
  # programs.codex.enable = true;

  home.packages = with pkgs; [
    inputs.codex.packages.${pkgs.system}.default
    # nodejs_24
  ];
}
