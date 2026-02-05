{ pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      inter
      material-design-icons
      nerd-fonts.fira-code
    ];
    fontconfig.defaultFonts = {
      serif = [ "inter" ];
      sansSerif = [ "inter" ];
      monospace = [ "FiraCode" ];
    };
  };
}
