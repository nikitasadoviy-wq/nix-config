{ inputs, pkgs, fastInstall ? false, ... }:
{
  home.packages =
    [
      inputs.xmcl.packages.${pkgs.system}.default
    ]
    ++ (with pkgs;
      if fastInstall then [
        _2048
        vitetris
        crispy-doom
      ] else [
        _2048
        _2048-in-terminal
        vitetris
        nethack
        crispy-doom
        cemu
        ryubing
        dolphin-emu
        melonds
        azahar
        mgba
        sameboy
        snes9x
        pcsx2
        rpcs3
        ppsspp
        flycast
        blastem
        xemu
        retroarch
        mame
        mednafen
        dosbox-staging
        scummvm
      ]);
}
