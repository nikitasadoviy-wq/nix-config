
{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  # Virtual machine profile
  networking.hostName = "nixos-vm";

  # UEFI boot
  boot.loader.efi.canTouchEfiVariables = true;

  # Bootloader selection
  # Temporary default until the modular bootloader system is ready.
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 10;
  };

  # SSH: public-key authentication only
  services.openssh = {
    enable = true;

    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PubkeyAuthentication = true;
      PermitRootLogin = "no";
    };
  };

  # Networking
  networking.networkmanager.enable = true;

  # Virtual machine does not need physical Bluetooth devices.
  hardware.bluetooth.enable = false;
}
