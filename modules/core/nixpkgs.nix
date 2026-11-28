{ inputs, ... }:
{
  nixpkgs.overlays = [
    (final: _prev: {
      # Build custom packages against the final package set from this overlay.
      # This avoids capturing the outer module pkgs while the overlay is evaluated.
      _plombirPackages = import ../../pkgs {
        inherit inputs;
        pkgs = final;
        system = final.stdenv.hostPlatform.system;
      };
    })
    (final: prev: import ../../pkgs {
      inherit inputs;
      pkgs = final;
      system = final.stdenv.hostPlatform.system;
    })
  ];
}
