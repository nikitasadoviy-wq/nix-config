{ pkgs, ... }:

{
  services = {
    gvfs.enable = true;

    gnome = {
      tinysparql.enable = true;
      gnome-keyring.enable = true;
    };

    dbus = {
      enable = true;

      packages = with pkgs; [
        gcr
        gnome-settings-daemon
      ];
    };

    fstrim.enable = true;
    fwupd.enable = true;

    logind.settings.Login = {
      HandlePowerKey = "ignore";
      HandleLidSwitchDocked = "ignore";
    };

    udisks2.enable = true;
  };
}
