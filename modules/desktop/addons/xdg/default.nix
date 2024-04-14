{ config, vars, ... }:

{
  xdg = {
    enable = true;
    configHome = /home/${vars.user}/dotfiles;
  };

}
