{ homeModules, pkgs, ... }:
{
  imports =
    with homeModules.desktop;
    [
      niri
    ]
    ++ (with homeModules.apps.cli; [
      fish
      fastfetch
      neovim
      zellij
      claude
      codex
    ])
    ++ (with homeModules.apps.gui; [
      kitty
      firefox
      zen
    ])
    ++ (with homeModules.dev; [
      direnv
    ]);

  home.packages = with pkgs; [
    postman
    google-cloud-sdk
    docker
    networkmanagerapplet
    openssl
    gcc
    brightnessctl

    google-chrome
    nautilus
    vscode
    grim
    obs-studio
  ];

  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        diffRenderers = [
          {
            command = "delta --dark --paging=never --line-numbers";
            colorArg = "always";
          }
        ];
      };
    };
  };


  programs.git = {
    enable = true;
    delta = {
      enable = true;
    };
  };

  home.sessionPath = [
    "$HOME/.npm-global/bin"
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  theme = "gruvbox";

  home.stateVersion = "26.05";


  xdg = {
    enable = true;
    configHome = "/home/rwan/dotfiles";


    mime.enable = true;
    mimeApps.defaultApplications = [
      "firefox.desktop"
    ];
  };
}
