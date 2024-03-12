{
  config,
  pkgs,
  hyprland,
  ...
}:

let
  exec = "exec Hyprland";
in {
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true; #check this
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };
  # xdg.portal.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  services = {
    upower.enable = true;
  };

  environment = {
    loginShellInit = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        ${exec}
      fi
    '';

    systemPackages = with pkgs; [
      wl-clipboard
    ];
  };

}
