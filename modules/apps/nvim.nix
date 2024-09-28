{ inputs, pkgs, ... }:

let
  theme = (import ../colorscheme/default.nix).theme;
in {

  home.packages = with pkgs; [
  	# nodejs
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  xdg.configFile = {
    nvim = {
      source = ../../dotfiles/nvimdot;
      recursive = true;
    };
  
    "nvim/lua/util/nix_colorscheme.lua".text = ''
       return "${theme.nvim-colorscheme}"
    '';
  };
  
  #home.packages = with pkgs; [
  #];

}
