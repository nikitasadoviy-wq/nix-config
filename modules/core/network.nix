{ pkgs, host, ... }:

{
  networking = {
    hostName = host;
    networkmanager.enable = true;

    nameservers = [ "1.1.1.1" ];

    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
