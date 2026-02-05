{ ... }:
{
  services = {
    pulseaudio.enable = false;
    thermald.enable = true;
    upower.enable = true;
    openssh.enable = true;

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
  };
}
