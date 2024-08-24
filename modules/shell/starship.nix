{ ... }:
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
  };

  xdg.configFile = {
    starship = {
      source = ../../dotfiles/starship;
      recursive = true;
    };
  };
}
