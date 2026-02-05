{ config, dotfiles, ... }:
{
  programs.zellij = {
    enable = true;
    enableFishIntegration = true; # auto opens zellij
  };

  home.sessionVariables = {
    ZELLIJ_CONFIG_DIR = "$XDG_CONFIG_HOME/zellij";
  };

  xdg.configFile = {
    zellij = {
      source = "${dotfiles}/zellij";
      recursive = true;
    };

    "zellij/themes/${config.theme}.kdl".text = with config.colorscheme; ''
      themes {
        default {
          bg "${bg}"
          fg "${fg}"
          red "${red}"
          green "${green}"
          blue "${blue}"
          yellow "${yellow}"
          magenta "${magenta}"
          orange "${orange}"
          cyan "${cyan}"
          black "${bg}"
          white "${white}"
        }
      }
    '';
  };
}
