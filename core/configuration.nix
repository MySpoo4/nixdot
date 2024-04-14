{
  config,
  lib,
  pkgs,
  inputs,
  vars,
  ...
}:
{
  imports = [
    ../modules/desktop/hyprland
  ];

  users.users.${vars.user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    # shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
    # packageOverrides = pkgs: {
    #   nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
    #     inherit pkgs;
    #   };
    # };
  };

  security.pam.services.hyprlock = {
    text = ''
      auth include login
    '';
  };

  environment.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/dotfiles";
    NIXOS_OZONE_WL = "1";
    EDITOR = "nvim";
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      builders-use-substitutes = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixVersions.unstable;
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
  };

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      inter
      material-design-icons
      (nerdfonts.override { 
        fonts = [ 
          "FiraCode" 
          "JetBrainsMono"
        ]; 
      })
    ];
    fontconfig.defaultFonts = {
      serif = [ "inter" ];
      sansSerif = [ "inter" ];
      monospace = [ "FiraCode" ];
    };
  };

  system.stateVersion = "24.05";
}
