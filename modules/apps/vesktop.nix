{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vesktop
    vencord
  ];

  xdg.desktopEntries.vesktop = {
    type = "Application";
    name = "Vesktop";
    exec = "vesktop --disable-gpu";
  };
}
