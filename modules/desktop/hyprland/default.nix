{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true; #check this
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  environment = {
    systemPackages = with pkgs; [
    ];
  };

}
