#!/bin/sh

PRIMARY=$1
SECONDARY=$2

case "$3" in
  1)
    hyprctl dispatch "hl.dsp.focus({ workspace = 11 })"
    hyprctl dispatch "hl.dsp.focus({ workspace = 1 })"
    ;;
  2)
    hyprctl dispatch "hl.dsp.focus({ workspace = 12 })"
    hyprctl dispatch "hl.dsp.focus({ workspace = 2 })"
    ;;
  3)
    hyprctl dispatch "hl.dsp.focus({ workspace = 13 })"
    hyprctl dispatch "hl.dsp.focus({ workspace = 3 })"
    ;;
  4)
    hyprctl dispatch "hl.dsp.focus({ workspace = 14 })"
    hyprctl dispatch "hl.dsp.focus({ workspace = 4 })"
    ;;
  5)
    hyprctl dispatch "hl.dsp.focus({ workspace = 15 })"
    hyprctl dispatch "hl.dsp.focus({ workspace = 5 })"
    ;;
  6)
    hyprctl dispatch "hl.dsp.focus({ workspace = 16 })"
    hyprctl dispatch "hl.dsp.focus({ workspace = 6 })"
    ;;
  7)
    hyprctl dispatch "hl.dsp.focus({ workspace = 17 })"
    hyprctl dispatch "hl.dsp.focus({ workspace = 7 })"
    ;;
  8)
    hyprctl dispatch "hl.dsp.focus({ workspace = 18 })"
    hyprctl dispatch "hl.dsp.focus({ workspace = 8 })"
    ;;
  9)
    hyprctl dispatch "hl.dsp.focus({ workspace = 19 })"
    hyprctl dispatch "hl.dsp.focus({ workspace = 9 })"
    ;;
  10)
    hyprctl dispatch "hl.dsp.focus({ workspace = 20 })"
    hyprctl dispatch "hl.dsp.focus({ workspace = 10 })"
    ;;
esac
