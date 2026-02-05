{
  pkgs,
  dotfiles,
  ...
}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  xdg.configFile = {
    nvim = {
      source = "${dotfiles}/nvimdot";
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    # # treesitter
    # nodejs
  ];
}
