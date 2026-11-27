{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      source = ~/.config/hypr/monitors.conf
      source = ~/.config/hypr/workspaces.conf
    '';
  };

  home.packages = with pkgs; [
    nwg-displays
  ];
}
