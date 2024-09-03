{
  name = "gruvbox";
  scheme = {
    colors = {
      primary = "#928374";
      bg = "#282828";
      bg1 = "#32302f";
      fg = "#d4be98";
      fg1 = "#ddc7a1";
      black = "#1b1b1b";
      black1 = "#252423";
      grey = "#7c6f64";
      grey1 = "#928374";
      grey2 = "#a89984";
      white = "#ebdbb2";
      red = "#ea6962";
      orange = "#e78a43";
      yellow = "#d8a657";
      green = "#a9b665";
      blue = "#7daea3";
      cyan = "#89b482";
      magenta = "#d3869b";
    };
  };

  nvim-colorscheme = "gruvbox-material";
  gtk-theme = {
    name = "Gruvbox-Dark";
    package = "gruvbox-gtk-theme";
  };
  
  cursor = {
    name = "Vimix-cursors";
    package = "vimix-cursors";
    extra = false;
    size = 24;
  };
  
  # cursor = {
  #   name = "Capitaine Cursors (Gruvbox)";
  #   package = "capitaine-cursors-themed";
  #   extra = false;
  #   size = 24;
  # };

}
