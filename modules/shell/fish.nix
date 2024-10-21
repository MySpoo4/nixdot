{ ... }:
let
  exec = "exec Hyprland";
in {
  programs.fish = {
    enable = true;

    functions = {
      fish_greeting = {
        body = "fastfetch";
      };
    };

    loginShellInit = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]
        ${exec}
      end
    '';

    shellInit = ''
      set -Ux STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/starship.toml
      set -Ux STARSHIP_CACHE $XDG_CONFIG_HOME/starship/cache 

      fish_vi_key_bindings

      direnv hook fish | source
    '';
  };
}
