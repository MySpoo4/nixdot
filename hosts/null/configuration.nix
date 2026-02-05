{
  pkgs,
  systemModules,
  ...
}:
{
  imports = with systemModules; [
    home-manager
    packages
    locale
    services
    hardware
    fonts
    boot
    nix-stuff
    environment
    network
    power
  ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.blueman.enable = true;

# Enable PipeWire with Bluetooth support
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    wireplumber.enable = true;

    # # IMPORTANT: enable Bluetooth codecs
    # bluetooth.enable = true;
    # bluetooth.supportAptX = true;  # optional
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

  system.stateVersion = "24.05";
}
