{ pkgs, ... }:
let
  theme = (import ../colorscheme/default.nix).theme;
in
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
  };

  xdg.configFile = {
    kitty = {
      source = ../../dotfiles/kitty;
      recursive = true;
    };

    "kitty/theme.conf".text = with theme.scheme.colors; ''
      foreground              ${fg}
      background              ${bg}
      selection_foreground    ${bg}
      selection_background    ${primary}

      cursor                  ${primary}
      cursor_text_color       ${bg}

      url_color               ${primary}

      active_border_color     ${primary}
      inactive_border_color   ${bg1}
      bell_border_color       ${yellow}

      wayland_titlebar_color  ${bg}
      
      active_tab_foreground   ${black}
      active_tab_background   ${fg}
      inactive_tab_foreground ${fg}
      inactive_tab_background ${bg1}
      tab_bar_background      ${black}

      #black
      color0  ${bg1}
      color8  ${bg}

      #red
      color1  ${red}
      color9  ${red}

      #green
      color2  ${green}
      color10 ${green}

      #yellow 
      color3  ${yellow}
      color11 ${yellow}
      
      #blue
      color4  ${blue}
      color12 ${blue}

      #magenta
      color5  ${magenta}
      color13 ${magenta}

      #cyan
      color6  ${cyan}
      color14 ${cyan}

      #white
      color7  ${white}
      color15 ${fg1}
    '';
  };
}
