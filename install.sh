#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

if [[ "${EUID}" -eq 0 ]]; then
  echo "Do not run this installer as root. Run it as your regular user."
  exit 1
fi

if ! command -v whiptail >/dev/null 2>&1; then
  echo "whiptail is missing; starting the installer with newt from nix-shell..."
  exec nix-shell -p newt --run "bash '$SCRIPT_DIR/install.sh'"
fi

if [[ ! -f /etc/nixos/hardware-configuration.nix ]]; then
  whiptail --title "Plombir installer" --msgbox \
    "/etc/nixos/hardware-configuration.nix was not found. Install NixOS first, then run this installer." 10 64
  exit 1
fi

default_username="${USER:-nikituch}"
while true; do
  username="$(whiptail --title "Plombir — user" \
    --inputbox "Choose the Linux username:" 9 56 "$default_username" 3>&1 1>&2 2>&3)" || exit 0

  if [[ "$username" =~ ^[a-z][a-z0-9_-]{0,31}$ ]]; then
    break
  fi

  whiptail --title "Invalid username" --msgbox \
    "Use 1–32 characters: lowercase letters, digits, underscore or hyphen. The first character must be a letter." 10 64
done

HOST="$(whiptail --title "Plombir — host" --radiolist \
  "Choose the target hardware profile:" 12 64 3 \
  "laptop" "Laptop (Ryzen / hybrid graphics profile)" ON \
  "desktop" "Desktop PC" OFF \
  "vm" "Virtual machine" OFF 3>&1 1>&2 2>&3)" || exit 0

if [[ "$HOST" != "laptop" && "$HOST" != "desktop" && "$HOST" != "vm" ]]; then
  echo "Invalid host selection: $HOST" >&2
  exit 1
fi

DISABLE_ASEPRITE="0"
if whiptail --title "Aseprite" --yesno \
  "Aseprite is enabled by default. Disable it to skip its package during this build?" 10 64 --defaultno; then
  DISABLE_ASEPRITE="1"
fi

FAST_INSTALL="0"
if whiptail --title "Fast install" --yesno \
  "Use the minimal profile? It skips optional applications and large package groups to reduce downloads and build time. You can install them later." 11 68 --defaultno; then
  FAST_INSTALL="1"
fi

summary="Username: $username
Host profile: $HOST
Aseprite: $([[ "$DISABLE_ASEPRITE" == "1" ]] && echo Disabled || echo Enabled)
Fast profile: $([[ "$FAST_INSTALL" == "1" ]] && echo Enabled || echo Disabled)

The installer will copy the hardware configuration and run nixos-rebuild switch."

if ! whiptail --title "Review installation" --yesno "$summary" 15 68; then
  exit 0
fi

mkdir -p "$HOME/Music" "$HOME/Documents" "$HOME/Pictures/wallpapers/others"

if [[ "$HOST" != "vm" ]]; then
  cp /etc/nixos/hardware-configuration.nix "hosts/$HOST/hardware-configuration.nix"
else
  cp /etc/nixos/hardware-configuration.nix "hosts/vm/hardware-configuration.nix"
fi

if [[ -d wallpapers/otherWallpaper/gruvbox ]]; then
  cp -n wallpapers/otherWallpaper/gruvbox/* "$HOME/Pictures/wallpapers/others/" 2>/dev/null || true
fi
if [[ -d wallpapers/otherWallpaper/nixos ]]; then
  cp -n wallpapers/otherWallpaper/nixos/* "$HOME/Pictures/wallpapers/others/" 2>/dev/null || true
fi
ln -sfn "$SCRIPT_DIR/wallpapers/wallpaper.png" "$HOME/Pictures/wallpapers/wallpaper"

echo "Building Plombir for host '$HOST'..."
sudo env \
  NIXOS_USERNAME="$username" \
  DISABLE_ASEPRITE="$DISABLE_ASEPRITE" \
  PLOMBIR_FAST_INSTALL="$FAST_INSTALL" \
  nixos-rebuild switch --impure --flake ".#$HOST"

echo "Plombir was built and activated successfully. Reboot when convenient."
