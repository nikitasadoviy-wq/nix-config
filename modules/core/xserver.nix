
{ ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us,ua,ru";
    };

    libinput.enable = true;
  };

  systemd.settings.Manager.DefaultTimeoutStopSec = "10s";
}
