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

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

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
