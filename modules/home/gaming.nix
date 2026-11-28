{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Minecraft
    inputs.xmcl.packages.${pkgs.system}.default

    ## Cli games
    _2048
    _2048-in-terminal
    vitetris
    nethack

    ## Celeste
    # olympus
    # celeste-classic
    # celeste-classic-pm

    ## Doom
    crispy-doom

    ## Emulation
    cemu
    mgba
    snes9x
    sameboy
    melonds
    dolphin-emu
  ];
}
