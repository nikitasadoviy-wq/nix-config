{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Minecraft
    ## xmcl but in flake.nix

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
    ryubing
    mgba
    snes9x
    sameboy
    melonds
    dolphin-emu
  ];
}
