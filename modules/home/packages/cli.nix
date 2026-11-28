{ pkgs, fastInstall ? false, ... }:
{
  home.packages = with pkgs;
    if fastInstall then [
      eza fd gtrash man-pages ncdu ripgrep tldr
      hyperfine just tokei
      htop wavemon
      mpv ffmpeg file jq libnotify openssl pamixer playerctl
      socat unzip wget wl-clipboard xdg-utils
    ] else [
      duf eza fd gping gtrash hexyl man-pages ncdu ripgrep tldr
      aoc-cli asciinema asciinema-agg binsider bitwise broot caligula hyperfine just pastel scooter swappy tdf tokei translate-shell woomer yt-dlp-light
      epy gtt toipe ttyper
      htop onefetch wavemon
      asciiquarium-transparent cbonsai cmatrix countryfetch cowsay figlet fortune lavat lolcat pipes sl tty-clock
      imv lowfi mpv
      entr ffmpeg file jq killall libnotify mimeo openssl pamixer playerctl poweralertd socat udiskie unzip wget wl-clipboard xdg-utils winetricks wineWow64Packages.waylandFull
    ];
}