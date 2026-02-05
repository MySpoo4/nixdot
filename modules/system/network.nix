{ lib, config, ... }:
{
  options.systemModules.networking = {
    hostName = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Host name for machine on network";
    };
  };

  config.networking = {
    hostName = config.systemModules.networking.hostName;
    networkmanager.enable = true;
  };
}
