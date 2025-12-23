#!/bin/sh

PRIMARY=$1
SECONDARY=$2

case "$3" in
  1)
    hyprctl dispatch workspace 11
    hyprctl dispatch workspace 1
    ;;
  2)
    hyprctl dispatch workspace 12
    hyprctl dispatch workspace 2
    ;;
  3)
    hyprctl dispatch workspace 13
    hyprctl dispatch workspace 3
    ;;
  4)
    hyprctl dispatch workspace 14
    hyprctl dispatch workspace 4
    ;;
  5)
    hyprctl dispatch workspace 15
    hyprctl dispatch workspace 5
    ;;
  6)
    hyprctl dispatch workspace 16
    hyprctl dispatch workspace 6
    ;;
  7)
    hyprctl dispatch workspace 17
    hyprctl dispatch workspace 7
    ;;
  8)
    hyprctl dispatch workspace 18
    hyprctl dispatch workspace 8
    ;;
  9)
    hyprctl dispatch workspace 19
    hyprctl dispatch workspace 9
    ;;
  10)
    hyprctl dispatch workspace 20
    hyprctl dispatch workspace 10
    ;;
esac
