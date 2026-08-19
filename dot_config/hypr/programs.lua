---------------------
---- MY PROGRAMS ----
---------------------

-- See https://wiki.hypr.land/Configuring/Start/

return {
    terminal        = "kitty",
    fileManager     = "thunar",
    menuApps        = "~/.config/hypr/script/rofi/rofi_drun.sh",
    menuFileManager = "~/.config/hypr/script/rofi/rofi_file.sh",
    menuRunApps     = "~/.config/hypr/script/rofi/rofi_window.sh",
    browser         = "librewolf",

    hyprlock      = "hyprlock -c ~/.config/hypr/misc/hyprlock.conf",
    hyprshot      = "hyprshot -m region -o /home/krab1o/Screenshots -r",
    waybarRestart = "~/.config/waybar/script/relaunch.sh",

    clipboard = "~/.config/hypr/script/rofi/rofi_clipboard.sh",

    -- sunsetr
    sunsetrManual = "~/.config/hypr/script/sunsetr/manual.sh",
    sunsetrGeo    = "~/.config/hypr/script/sunsetr/geo.sh",
    sunsetrDay    = "~/.config/hypr/script/sunsetr/day.sh",

    toggleMonitor = "~/.config/hypr/script/toggle_monitor.sh",
}
