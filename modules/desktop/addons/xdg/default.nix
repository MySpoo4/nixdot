{ config, vars, ... }:

{
  xdg = {
    enable = true;
    configHome = /home/${vars.user}/dotfiles;
    userDirs = {
      download = /home/${vars.user}/downloads;
      documents = /home/${vars.user}/documents;
    };
  };

}
