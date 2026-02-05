{ ... }:
let
  exec = "exec niri-session";
in
{
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
      fish_vi_key_bindings

      direnv hook fish | source
    '';
  };
}
