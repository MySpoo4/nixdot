{ lib, config, ... }: 
{
  options.theme = lib.mkOption {
    type = lib.types.str;
    description = "Theme name";
  };

  options.colorscheme = lib.mkOption {
    type = lib.types.attrs;
    description = "Colorscheme palette";
  };

  config = 
  let
    theme = (import (import ./colorschemes).${config.theme});
  in
  {
    colorscheme = theme.colors;
    gtk = theme.gtk;
  };
}
