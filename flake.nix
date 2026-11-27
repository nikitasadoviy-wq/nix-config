
{
  description = "Nikituch's modular NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    maple-mono = {
      url = "github:subframe7536/maple-font?ref=v7.8";
      flake = false;
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    superfile.url = "github:yorukot/superfile";
  };

  outputs =
    { nixpkgs, self, ... }@inputs:
    let
      username = "nikituch";
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            inputs.disko.nixosModules.disko
            ./hosts/desktop
          ];

          specialArgs = {
            host = "desktop";
            inherit self inputs username;
          };
        };

        laptop = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            inputs.disko.nixosModules.disko
            ./hosts/laptop
          ];

          specialArgs = {
            host = "laptop";
            inherit self inputs username;
          };
        };

        vm = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            inputs.disko.nixosModules.disko
            ./hosts/vm
          ];

          specialArgs = {
            host = "vm";
            inherit self inputs username;
          };
        };
      };
    };
}
