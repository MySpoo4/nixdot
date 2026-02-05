{ lib, config, ... }:
{
  options.systemModules.locale = {
    timeZone = lib.mkOption {
      type = lib.types.str;
      default = "America/New_York";
      description = "Time zone location";
    };
  };

  config = {
    time.timeZone = config.systemModules.locale.timeZone;

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

  };
}
