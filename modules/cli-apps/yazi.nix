{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    # TODO remove later (problem with building)
    package = pkgs.yazi.override {
      _7zz = (pkgs._7zz.override { useUasm = true; });
    };
  };

  xdg.configFile = {
    yazi = {
      source = ../../dotfiles/yazi;
      recursive = true;
    };
  };
}
