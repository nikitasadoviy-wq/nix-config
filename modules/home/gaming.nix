{ pkgs, fastInstall ? false, ... }:
{
  home.packages = with pkgs;
    if fastInstall then [
      _2048 vitetris crispy-doom
    ] else [
      _2048 _2048-in-terminal vitetris nethack crispy-doom
      cemu ryubing dolphin-emu melonds azahar mgba sameboy snes9x
      pcsx2 rpcs3 ppsspp vita3k flycast blastem xemu
      retroarch mame mednafen dosbox-staging scummvm
    ];
}