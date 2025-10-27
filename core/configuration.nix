{
  pkgs,
  ...
}:
{
  time.timeZone = "America/New_York";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_MONETARY = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  console = {
    font = "FiraCode";
    keyMap = "us";
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  environment.variables = {
    XDG_CONFIG_HOME = "$HOME/dotfiles";
    # wayland support for chromium and electron
    NIXOS_OZONE_WL = "1";
    # default editor
    EDITOR = "nvim";
  };

  programs.nix-ld.enable = true;

  services = {
    pipewire.enabled = true;
    pulseaudio.enable = false;
    thermald.enable = true;
    upower.enable = true;
    openssh.enable = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      builders-use-substitutes = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
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
      nerd-fonts.fira-code
    ];
    fontconfig.defaultFonts = {
      serif = [ "inter" ];
      sansSerif = [ "inter" ];
      monospace = [ "FiraCode" ];
    };
  };
}
