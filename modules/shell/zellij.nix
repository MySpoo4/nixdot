{ ... }:
let
  theme = (import ../colorscheme/default.nix).theme;
in
{
  programs.zellij.enable = true;

  xdg.configFile = {
    zellij = {
      source = ../../dotfiles/zellij;
      recursive = true;
    };

    "zellij/themes/${theme.name}.kdl".text = with theme.scheme.colors; ''
      themes {
        ${theme.name} {
          bg "${bg}"
          fg "${fg}"
          red "${red}"
          green "${green}"
          blue "${blue}"
          yellow "${yellow}"
          magenta "${magenta}"
          orange "${orange}"
          cyan "${cyan}"
          black "${black}"
          white "${white}"
        }
      }
    '';
  };
}
