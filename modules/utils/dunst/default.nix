{ pkgs, ... }:
let
  theme = (import ../../colorscheme/default.nix).theme;
in
{
  home.packages = [ pkgs.libnotify ];
  services.dunst = {
    enable = true;
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    settings = with theme.scheme.colors; {
      global = {
        monitor = 0;
        width = 300;
        height = 200;
        origin = "top-right";
        offset = "20x20";
        scale = 0;
        notification_limit = 20;
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 0;
        progress_bar_min_width = 125;
        progress_bar_max_width = 250;
        progress_bar_corner_radius = 0;
        icon_corner_radius = 5;
        indicate_hidden = true;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 10;
        frame_width = 3;
        frame_color = primary;
        gap_size = 5;
        separator_color = "auto";
        font = "FiraCode Nerd Font 10";
        line_height = 3;
        markup = "full";
        fornat = ''<b>$s</b>\n%b'';
        word_wrap = true;
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        sort = true;
        ellipsize = "middle";
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = true;
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 128;
        sticky_history = true;
        history_length = 20;
        force_xwayland = false;
      };
      urgency_low = {
        background = "${altbg}90";
        foreground = primary;
        frame_color = primary;
        timeout = 10;
      };
      urgency_normal = {
        background = "${altbg}90";
        foreground = primary;
        frame_color = primary;
        timeout = 10;
      };
      urgency_critical = {
        background = "${red}90";
        foreground = altbg;
        frame_color = bg;
        timeout = 0;
      };
    };
  };
}
