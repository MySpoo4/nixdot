{
  inputs,
  pkgs,
  dotfiles,
  ...
}:
{
  imports = [ inputs.niri.homeModules.niri ];

  programs.niri = {
    enable = true;
  };

  home.packages = with pkgs; [
    # alacritty
    fuzzel
  ];

  xdg = {
    configFile = {
      niri = {
        source = "${dotfiles}/niri";
        recursive = true;
      };
    };

    portal = {
      enable = true;
      extraPortals = with pkgs; [
        # xdg-desktop-portal
        # xdg-desktop-portal-gtk
        # xdg-desktop-portal-gnome
        # gnome-keyring
      ];
    };
  };
}
