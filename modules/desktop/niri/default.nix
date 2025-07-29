{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.niri = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  # systemd.user.services.niri = {
  #
  # };

  xdg = {
    configFile = {
      niri = {
        source = ../../../dotfiles/niri;
        recursive = true;
      };
    };

    portal = {
      enable = true;
      extraPortals = with pkgs; [
        # xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
        gnome-keyring
      ];
    };
  };

  # environment = {
  #   systemPackages = with pkgs; [
  #   ];
  # };
  #
}
