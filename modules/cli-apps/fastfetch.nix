{ ... }:
{
  programs.fastfetch.enable = true;

  xdg.configFile = {
    fastfetch = {
      source = ../../dotfiles/fastfetch;
      recursive = true;
    };
  };
}
