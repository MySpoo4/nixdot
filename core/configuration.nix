{
  config,
  lib,
  pkgs,
  inputs,
  vars,
  ...
}:
{
  imports = (
    import ../modules/desktops
  );

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

  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  environment.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/dotfiles";
    NIXOS_OZONE_WL = "1";
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
      font-awesome
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
    fontconfig.defaultFonts = {
      serif = [ "inter" ];
      sansSerif = [ "inter" ];
      monospace = [ "FiraCode" ];
    };
  };

  system.stateVersion = "24.05";
}
