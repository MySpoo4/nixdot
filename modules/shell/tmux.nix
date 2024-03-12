{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      # {
      #   plugin = catppuccin;
      #   extraConfig = ''
      #     set -g @catppuccin_flavour 'macchiato'
      #   '';
      # }
      {
        plugin = vim-tmux-navigator;
      }
    ];
  };

}
