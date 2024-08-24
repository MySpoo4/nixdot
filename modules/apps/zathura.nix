{ ... }:
{
  programs.zathura.enable = true;

  xdg.configFile = {
    zathura = {
      source = ../../dotfiles/zathura;
      recursive = true;
    };
  };
}
