
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Minecraft
    ## XMCL is managed through flake.nix

    ## CLI games
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

    ## Nintendo
    cemu              # Wii U
    ryubing           # Nintendo Switch
    dolphin-emu       # GameCube / Wii
    melonds           # Nintendo DS
    azahar            # Nintendo 3DS
    mgba              # Game Boy / Game Boy Color / GBA
    sameboy           # Game Boy / Game Boy Color
    snes9x            # SNES

    ## PlayStation
    pcsx2             # PlayStation 2
    rpcs3             # PlayStation 3
    ppsspp            # PlayStation Portable
    vita3k            # PlayStation Vita

    ## Sega
    flycast           # Dreamcast / Naomi
    blastem           # Mega Drive / Genesis

    ## Microsoft
    xemu              # Original Xbox

    ## Multi-system / Retro
    retroarch         # Multi-system emulator
    mame              # Arcade machines
    mednafen          # Multi-system emulator

    ## Classic computers
    dosbox-staging    # MS-DOS
    scummvm           # Classic adventure games
  ];
}
