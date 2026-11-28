{ pkgs, fastInstall ? false, ... }:
{
  home.packages = with pkgs;
    if fastInstall then [
      pavucontrol vlc gnome-calculator gnome-disk-utility
    ] else [
      amberol audacity gimp media-downloader obs-studio pavucontrol video-trimmer vlc
      newsflash libreoffice gnome-calculator
      dconf-editor gnome-disk-utility popsicle mission-center zenity
      ldtk tiled
    ];
}