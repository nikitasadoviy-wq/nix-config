{
  pkgs,
  inputs,
  username,
  host,
  disableAseprite,
  fastInstall,
  ...
}:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host disableAseprite fastInstall; };
    users.${username} = {
      imports = [ ./../home ];
      home = { inherit username; homeDirectory = "/home/${username}"; stateVersion = "26.05"; };
      programs.home-manager.enable = true;
    };
    backupFileExtension = "hm-backup";
  };

  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  nix.settings.allowed-users = [ username ];
}