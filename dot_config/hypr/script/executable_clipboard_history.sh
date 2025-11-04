#!/bin/bash

dir="$HOME/.config/rofi/launchers/type-1"
theme='style-6'

cliphist list |
	rofi -dmenu -theme ${dir}/${theme}.rasi |
	cliphist decode |
	wl-copy
