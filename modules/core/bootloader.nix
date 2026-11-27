{ pkgs, ... }:
{
  boot = {
    loader = {
      limine = {
        enable = true;
        maxGenerations = 10;
      };

      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "hid-nintendo" ];
    supportedFilesystems = [ "ntfs" ];
  };
}
