{ inputs, pkgs, ... }:

let
  theme = (import ../colorscheme/default.nix).theme;
in {

  # xdg.configFile.nvim = {
  #   source = ../../dotfiles/nvimdot;
  #   recursive = true;
  # };

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
