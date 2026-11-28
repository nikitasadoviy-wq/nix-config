{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      source = ~/.config/hypr/monitors.conf
      source = ~/.config/hypr/workspaces.conf
    '';
  };

  # Keep both sourced files present on a fresh install. Edit them to add
  # machine-specific monitor and workspace rules.
  home.file.".config/hypr/monitors.conf".text = ''
    # Add monitor rules here, for example:
    # monitor = , preferred, auto, 1
  '';

  home.file.".config/hypr/workspaces.conf".text = ''
    # Add workspace rules here.
  '';

  home.packages = with pkgs; [
    nwg-displays
  ];
}
