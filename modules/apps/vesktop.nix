{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vesktop
    xwaylandvideobridge # needed to stream wayland apps using x11 (smthing like that)
  ];

  xdg.desktopEntries.vesktop = {
    type = "Application";
    name = "Vesktop";
    exec = "vesktop --disable-gpu";
  };
}
