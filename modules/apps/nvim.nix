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

    nvim-note = {
      source = ../../dotfiles/nvim-note;
      recursive = true;
    };
  
    "nvim-note/lua/util/nix_colorscheme.lua".text = ''
       return "${theme.nvim-colorscheme}"
    '';
  };
  
  #home.packages = with pkgs; [
  #];

}
