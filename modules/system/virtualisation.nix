{ lib, config, ... }:
{
  virtualisation.docker.enable = true;
  #options.systemModules.virtualisation = {
  #  docker = lib.mkOption {
  #    type = lib.types.bool;
  #    default = false;
  #    description = "Whether to enable docker";
  #  };
  #};

  #config.virtualisation = lib.mkIf config.systemModules.virtualisation.docker {
  #  docker = {
  #    enable = true;
  #    rootless = {
  #      enable = true;
  #      setSocketVariable = true;
  #    };
  #  };
  #};
}
