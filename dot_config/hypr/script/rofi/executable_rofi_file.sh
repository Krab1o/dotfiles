#!/usr/bin/env bash

rofi \
	-show filebrowser \
	-modes filebrowser \
	-filebrowser-directory "$HOME" \
	-theme $HOME/.config/rofi/main.rasi
