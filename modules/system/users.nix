{ lib, config, ... }:
let

in
{
  options.systemModules.users = {
    users = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      description = "List of users to add";
    };
  };

  config = {

  };
}
