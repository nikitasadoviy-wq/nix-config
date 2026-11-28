{ pkgs, ... }:
{
  boot = {
    loader = {
      limine.enable = true;
      efi.canTouchEfiVariables = true;
      limine.maxGenerations = 10;
    };

    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "hid-nintendo" ];
    supportedFilesystems = [ "ntfs" ];
  };
}
