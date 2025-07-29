{ pkgs, lib, ... }:
let
  theme = (import ../colorscheme/default.nix).theme;
in
{
  # home.packages = with pkgs; [
  #   termusic
  #   yt-dlp
  # ];
  #
  # xdg.configFile = {
  #   "termusic/tui.toml".text =
  #     (builtins.readFile (../../dotfiles/termusic/tui.toml))
  #     + (with theme.scheme.colors; ''
  #       [theme]
  #       name = "Gruvbox"
  #       author = "empty author"
  #
  #       [theme.primary]
  #       background = "${bg}"
  #       foreground = "${fg}"
  #
  #       [theme.cursor]
  #       text = "${white}"
  #       cursor = "${white}"
  #
  #       [theme.normal]
  #       black = "${black}"
  #       red = "${red}"
  #       green = "${green}"
  #       yellow = "${yellow}"
  #       blue = "${blue}"
  #       magenta = "${magenta}"
  #       cyan = "${cyan}"
  #       white = "${white}"
  #
  #       [theme.bright]
  #       black = "${black}"
  #       red = "${red}"
  #       green = "${green}"
  #       yellow = "${yellow}"
  #       blue = "${blue}"
  #       magenta = "${magenta}"
  #       cyan = "${cyan}"
  #       white = "${white}"
  #     '');
  # };
}
