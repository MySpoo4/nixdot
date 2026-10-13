{
  pkgs,
  systemModules,
  ...
}:
{
  imports = with systemModules; [
    boot
    home-manager
    packages
    locale
    services
    hardware
    fonts
    nix-stuff
    environment
    network
    power
  ];

#   hardware.bluetooth.enable = true;
#   hardware.bluetooth.powerOnBoot = true;
#
#   services.blueman.enable = true;
#
# # Enable PipeWire with Bluetooth support
#   services.pipewire = {
#     enable = true;
#     alsa.enable = true;
#     alsa.support32Bit = true;
#     pulse.enable = true;
#
#     wireplumber.enable = true;
#
#     # # IMPORTANT: enable Bluetooth codecs
#     # bluetooth.enable = true;
#     # bluetooth.supportAptX = true;  # optional
#   };
#

  services.tailscale = {
    # Enable tailscale at startup
    enable = true;

    # If you would like to use a preauthorized key, set
    # authKeyFile = "/run/secrets/tailscale_key";
    # Note: maximum expire time is 90 days
  };


  virtualisation.docker.enable = true;

  programs.dconf.enable = true;

  xdg.portal = {
    config.niri = {
      default = [ "gnome" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "gnome" ];
    };
  };

  systemModules = {
    home-manager.usersDir = ./users;

    locale.timeZone = "America/Atlanta";

    # hardware.graphics.extraPkgs = with pkgs; [
    #   # intel-media-driver
    #   # vpl-gpu-rt
    # ];

    power.isLaptop = true;
  };

  environment.pathsToLink = [
     "/share/application"
     "/share/xdg-desktop-portal"
  ];

  users.users.rwan = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
    ];
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };

  system.stateVersion = "26.05";
}
