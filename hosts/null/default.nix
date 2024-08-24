{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [ ./hardware-configuration.nix ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi = {
        canTouchEfiVariables = true;
      };
      timeout = 5;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  services.openssh.enable = true;

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vpl-gpu-rt
      ];
    };
  };

  networking = {
    # type null pokemon
    hostName = "null";
    networkmanager.enable = true;
  };

  time.timeZone = "America/New_York";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_MONETARY = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  hardware = {
    pulseaudio.enable = false;
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
  };

  environment.systemPackages = [ pkgs.tpacpi-bat ];
  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
  services = {
    thinkfan.enable = true;
    thermald.enable = true;
    upower.enable = true;
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "ondemand";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_BOOST_ON_BAT = 0;
        CPU_BOOST_ON_AC = 1;
        DISK_IDLE_SECS_ON_AC = 0;
        DISK_IDLE_SECS_ON_BAT = 2;
        MAX_LOST_WORK_SECS_ON_AC = 15;
        MAX_LOST_WORK_SECS_ON_BAT = 60;
        SCHED_POWERSAVE_ON_AC = 0;
        SCHED_POWERSAVE_ON_BAT = 1;
        START_CHARGE_THRESH_BAT0 = 60;
        STOP_CHARGE_THRESH_BAT0 = 85;
        DEVICES_TO_DISABLE_ON_LAN_CONNECT = "wifi wwan";
        DEVICES_TO_DISABLE_ON_WIFI_CONNECT = "wwan";
        DEVICES_TO_DISABLE_ON_WWAN_CONNECT = "wifi";
        DEVICES_TO_ENABLE_ON_LAN_DISCONNECT = "wifi wwan";
        DEVICES_TO_ENABLE_ON_WIFI_DISCONNECT = "";
        DEVICES_TO_ENABLE_ON_WWAN_DISCONNECT = "";
      };
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
  };

  programs.nix-ld.enable = true;
}
