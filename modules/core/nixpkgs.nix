{ inputs, ... }:
{
  nixpkgs.overlays = [
    (final: _prev: import ../../pkgs {
      inherit inputs;
      pkgs = final;
      system = final.stdenv.hostPlatform.system;
    })
  ];
}
