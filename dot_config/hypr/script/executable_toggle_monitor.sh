#!/bin/sh

LAPTOP="eDP-1"
EXT="HDMI-A-1"

STATE="$HOME/.cache/hypr-monitor-mode"

# если внешнего монитора нет — просто сброс
if ! hyprctl monitors all | grep -q "$EXT"; then
    hyprctl keyword monitor "$LAPTOP,preferred,0x0,1.2"
    rm -f "$STATE"
    exit 0
fi

# режим по умолчанию
MODE="extended"
[ -f "$STATE" ] && MODE=$(cat "$STATE")
echo $MODE

if [ "$MODE" = "extended" ]; then
    # → mirror
    hyprctl keyword monitor "$LAPTOP, 1920x1080@60, 0x0, 1"
    hyprctl keyword monitor "$EXT, 1920x1080@60, 1920x0, 1, mirror, $LAPTOP"
    echo "mirror" > "$STATE"
else
    # → extended
    hyprctl keyword monitor "$LAPTOP, 1920x1080@60, 0x0, 1.2"
    hyprctl keyword monitor "$EXT, 1920x1080@60, 1600x0, 1"
    echo "extended" > "$STATE"
fi
