{ lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  # Virtual machine profile
  networking.hostName = "nixos-vm";

  # UEFI boot. The shared core module configures Limine for every host.
  boot.loader.efi.canTouchEfiVariables = true;

  # SSH: public-key authentication only.
  # Add your public key to users.users.<username>.openssh.authorizedKeys.keys
  # before relying on remote access.
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
  hardware.bluetooth.enable = lib.mkForce false;
}
