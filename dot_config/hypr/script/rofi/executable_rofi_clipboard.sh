#!/bin/bash

cliphist list |
	rofi -dmenu -theme $HOME/.config/rofi/main.rasi |
	cliphist decode |
	wl-copy
