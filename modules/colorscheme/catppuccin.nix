{
  name = "catppuccin";
  scheme = {
    colors = {
      primary = "#b7bdf8";
      bg = "#24273a";
      altbg = "#1e2030";
      fg = "#cad3f5";
      altfg = "#b8c0e0";
      black = "#181926";
      red = "#ed8796";
      altred = "#ee99a0";
      orange = "#f5a97f";
      yellow = "#eed49f";
      green = "#a6da95";
      cyan = "#8bd5ca";
      blue = "#8aadf4";
      altblue = "#91d7e3";
      magenta = "#c6a0f6";
      white = "#cad3f5";
    };
  };

  nvim-colorscheme = "catppuccin";
  gtk-theme = {
    name = "Catppuccin-Macchiato-Standard-Lavender-Dark";
    override = true;
    package = "catppuccin-gtk";
    attr = {
      accents = [ "lavender" ];
      size = "standard";
      tweaks = [ "normal" ];
      variant = "macchiato";
    };
  };
  cursor = {
    name = "Catppuccin-Macchiato-Lavender-Cursors";
    package = "catppuccin-cursors";
    extra = true;
    accent = "macchiatoLavender";
    size = 24;
  };

}
