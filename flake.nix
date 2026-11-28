{
  description = "Plombir — modular NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    disko = { url = "github:nix-community/disko"; inputs.nixpkgs.follows = "nixpkgs"; };
    xmcl = { url = "github:x45iq/xmcl-nix"; inputs.nixpkgs.follows = "nixpkgs"; };
    home-manager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nix-index-database = { url = "github:nix-community/nix-index-database"; inputs.nixpkgs.follows = "nixpkgs"; };
    maple-mono = { url = "github:subframe7536/maple-font?ref=v7.8"; flake = false; };
    spicetify-nix = { url = "github:Gerg-L/spicetify-nix"; inputs.nixpkgs.follows = "nixpkgs"; };
    superfile.url = "github:yorukot/superfile";
  };

  outputs = { nixpkgs, self, ... }@inputs:
    let
      system = "x86_64-linux";
      username = let value = builtins.getEnv "NIXOS_USERNAME"; in if value != "" then value else "nikituch";
      disableAseprite = builtins.getEnv "DISABLE_ASEPRITE" == "1";
      fastInstall = builtins.getEnv "PLOMBIR_FAST_INSTALL" == "1";
      specialArgs = host: { inherit self inputs username disableAseprite fastInstall host; };
    in {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem { inherit system; specialArgs = specialArgs "desktop"; modules = [ inputs.disko.nixosModules.disko ./hosts/desktop ]; };
        laptop = nixpkgs.lib.nixosSystem { inherit system; specialArgs = specialArgs "laptop"; modules = [ inputs.disko.nixosModules.disko ./hosts/laptop ]; };
        vm = nixpkgs.lib.nixosSystem { inherit system; specialArgs = specialArgs "vm"; modules = [ inputs.disko.nixosModules.disko ./hosts/vm ]; };
      };
    };
}