{
  config,
  lib,
  ...
}:
{
  options.systemModules.hardware = {
    graphics.extraPkgs = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
      description = "List of extra packages for graphics";
    };
  };

  config.hardware = {
    # bluetooth = {
    #   enable = true;
    #   powerOnBoot = false;
    # };

    graphics = {
      enable = true;
      extraPackages = config.systemModules.hardware.graphics.extraPkgs;
    };

    enableRedistributableFirmware = true;
  };
}
