{ ... }:
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };

  xdg.configFile = {
    yazi = {
      source = ../../dotfiles/yazi;
      recursive = true;
    };
  };
}
