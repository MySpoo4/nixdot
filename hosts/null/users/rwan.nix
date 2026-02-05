{ homeModules, ... }:
{
  imports =
    with homeModules.desktop;
    [
      niri
    ]
    ++ (with homeModules.apps.cli; [
      fish
      fastfetch
      neovim
      zellij
    ])
    ++ (with homeModules.apps.gui; [
      kitty
      firefox
    ])
    ++ (with homeModules.dev; [
      direnv
    ]);

  theme = "gruvbox";

  home.stateVersion = "24.05";


  xdg = {
    enable = true;
    configHome = "/home/rwan/dotfiles";
  };
}
