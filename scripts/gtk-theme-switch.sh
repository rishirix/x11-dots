#!/usr/bin/env bash
#
# gtk-theme-switch.sh — switch GTK3/GTK4 theme + libadwaita color-scheme
# Made for window-manager setups (dwm, etc.) with no DE session daemon.
#
# Usage:
#   gtk-theme-switch.sh -t <theme-name> -m <light|dark|auto> [-i <icon-theme>] [-c <cursor-theme>]
#
# Examples:
#   gtk-theme-switch.sh -t Nordic -m dark
#   gtk-theme-switch.sh -t Adwaita -m light -i Papirus-Dark
#
set -euo pipefail

THEME=""
MODE=""
ICON_THEME=""
CURSOR_THEME=""

usage() {
    echo "Usage: $0 -t <theme-name> -m <light|dark|auto> [-i <icon-theme>] [-c <cursor-theme>]"
    exit 1
}

while getopts "t:m:i:c:h" opt; do
    case "$opt" in
        t) THEME="$OPTARG" ;;
        m) MODE="$OPTARG" ;;
        i) ICON_THEME="$OPTARG" ;;
        c) CURSOR_THEME="$OPTARG" ;;
        h) usage ;;
        *) usage ;;
    esac
done

[[ -z "$THEME" || -z "$MODE" ]] && usage
[[ "$MODE" != "light" && "$MODE" != "dark" && "$MODE" != "auto" ]] && {
    echo "Error: mode must be light, dark, or auto"
    exit 1
}

GTK3_DIR="$HOME/.config/gtk-3.0"
GTK4_DIR="$HOME/.config/gtk-4.0"
GTK3_INI="$GTK3_DIR/settings.ini"
GTK4_INI="$GTK4_DIR/settings.ini"

mkdir -p "$GTK3_DIR" "$GTK4_DIR"

# Map our mode to the values each layer expects
case "$MODE" in
    dark)  PREFER_DARK="true"  ; COLOR_SCHEME="prefer-dark"  ;;
    light) PREFER_DARK="false" ; COLOR_SCHEME="prefer-light" ;;
    auto)  PREFER_DARK="false" ; COLOR_SCHEME="default"      ;;
esac

# --- helper: set a key=value in a [Settings] ini file, creating it if absent ---
set_ini_key() {
    local file="$1" key="$2" value="$3"

    if [[ ! -f "$file" ]]; then
        printf '[Settings]\n%s=%s\n' "$key" "$value" > "$file"
        return
    fi

    if ! grep -q '^\[Settings\]' "$file"; then
        # prepend the section header if the file exists but lacks it
        sed -i '1i [Settings]' "$file"
    fi

    if grep -q "^${key}=" "$file"; then
        sed -i "s|^${key}=.*|${key}=${value}|" "$file"
    else
        # insert right after [Settings]
        sed -i "/^\[Settings\]/a ${key}=${value}" "$file"
    fi
}

echo "==> Writing GTK3 settings ($GTK3_INI)"
set_ini_key "$GTK3_INI" "gtk-theme-name" "$THEME"
set_ini_key "$GTK3_INI" "gtk-application-prefer-dark-theme" "$PREFER_DARK"
[[ -n "$ICON_THEME" ]]   && set_ini_key "$GTK3_INI" "gtk-icon-theme-name" "$ICON_THEME"
[[ -n "$CURSOR_THEME" ]] && set_ini_key "$GTK3_INI" "gtk-cursor-theme-name" "$CURSOR_THEME"

echo "==> Writing GTK4 settings ($GTK4_INI)"
# GTK4 mostly ignores gtk-theme-name for libadwaita apps (they hardcode Adwaita
# and re-skin via color-scheme instead), but non-libadwaita GTK4 apps still
# read this, so we set it for compatibility.
set_ini_key "$GTK4_INI" "gtk-theme-name" "$THEME"
set_ini_key "$GTK4_INI" "gtk-application-prefer-dark-theme" "$PREFER_DARK"
[[ -n "$ICON_THEME" ]]   && set_ini_key "$GTK4_INI" "gtk-icon-theme-name" "$ICON_THEME"
[[ -n "$CURSOR_THEME" ]] && set_ini_key "$GTK4_INI" "gtk-cursor-theme-name" "$CURSOR_THEME"

# --- gsettings: this is what libadwaita's AdwStyleManager actually reads ---
if command -v gsettings >/dev/null 2>&1; then
    echo "==> Updating gsettings (org.gnome.desktop.interface)"
    gsettings set org.gnome.desktop.interface gtk-theme "$THEME" 2>/dev/null || true
    gsettings set org.gnome.desktop.interface color-scheme "$COLOR_SCHEME" 2>/dev/null || true
    [[ -n "$ICON_THEME" ]] && gsettings set org.gnome.desktop.interface icon-theme "$ICON_THEME" 2>/dev/null || true
    [[ -n "$CURSOR_THEME" ]] && gsettings set org.gnome.desktop.interface cursor-theme "$CURSOR_THEME" 2>/dev/null || true
else
    echo "!! gsettings not found — libadwaita apps won't pick up color-scheme."
    echo "   Install glib2/dconf (e.g. 'sudo pacman -S glib2 dconf' on Arch) and re-run."
fi

# --- legacy GTK2 apps, harmless to keep in sync ---
GTKRC2="$HOME/.gtkrc-2.0"
{
    echo "gtk-theme-name=\"$THEME\""
    [[ -n "$ICON_THEME" ]] && echo "gtk-icon-theme-name=\"$ICON_THEME\""
    [[ -n "$CURSOR_THEME" ]] && echo "gtk-cursor-theme-name=\"$CURSOR_THEME\""
} > "$GTKRC2"

# --- xdg-desktop-portal-gtk caches some of this; nudge it to reload if running ---
if pgrep -x xdg-desktop-portal-gtk >/dev/null 2>&1; then
    echo "==> Restarting xdg-desktop-portal-gtk so it re-reads settings"
    pkill -x xdg-desktop-portal-gtk 2>/dev/null || true
    (setsid xdg-desktop-portal-gtk >/dev/null 2>&1 &) || true
fi

echo "==> Done. Theme='$THEME' Mode='$MODE'"
echo "    Already-open GTK apps won't re-theme live; newly launched apps will."
