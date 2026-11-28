{ ... }:
{
  imports = [
    ./aseprite/aseprite.nix           # pixel art editor
    ./audacious/audacious.nix         # music player
    ./bat.nix                         # better cat command
    ./browser.nix                     # firefox based browser
    ./btop.nix                        # resouces monitor
    ./cava.nix                        # audio visualizer
    ./direnv.nix
    ./discord.nix                     # discord
    ./fastfetch/fastfetch.nix         # fetch tool
    ./fzf.nix                         # fuzzy finder
    ./gaming.nix                      # packages related to gaming
    ./ghostty/ghostty.nix             # terminal
    ./git.nix                         # version control
    ./gnome.nix                       # gnome apps
    ./gtk.nix                         # gtk theme
    ./hyprland                        # window manager
    ./lazygit.nix
    ./micro.nix
    ./nemo.nix                        # file manager
    ./nvim.nix                        # neovim editor
    ./obsidian.nix
    ./p10k/p10k.nix
    ./packages                        # other packages
    ./pomo/pomo.nix                   # TUI Pomodoro timer
    ./retroarch.nix
    ./rofi/rofi.nix                   # launcher
    ./../../scripts/scripts.nix       # personal scripts
    ./ssh.nix                         # ssh config
    ./spicetify.nix                   # spotify client
    ./superfile/superfile.nix         # terminal file manager
    ./swaylock.nix                    # lock screen
    ./swayosd.nix                     # brightness / volume widget
    ./swaync/swaync.nix               # notification daemon
    ./vscodium
    ./waybar
    ./waypaper.nix                    # GUI wallpaper picker
    ./xdg-mimes.nix                   # xdg config
    ./zsh
  ];
}
