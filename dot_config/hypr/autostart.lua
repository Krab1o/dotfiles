-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

local programs = require("programs")

-- Runs once, on the "hyprland.start" event (equivalent of the old exec-once)
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("sunsetr")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("hypridle --config ~/.config/hypr/misc/hypridle.conf")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=$XDG_CURRENT_DESKTOP PATH")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")  -- Stores only text data
    hl.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data

    hl.exec_cmd('awww img "/home/krab1o/wallpaper/firewatch_sunset.png"')

    -- Autostart
    hl.exec_cmd(programs.browser, { workspace = "1" })
    hl.exec_cmd("kitty", { workspace = "2" })
    -- hl.exec_cmd("obsidian", { workspace = "3", monitor = "HDMI-1" })
    -- hl.exec_cmd("betterbird", { workspace = "6", monitor = "HDMI-1" })
    -- hl.exec_cmd("Telegram", { workspace = "10", monitor = "HDMI-1" })
end)

-- Runs on every config (re)load, matching the old bare `exec = ...` semantics
-- GTK theme config
-- hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "YOUR_DARK_GTK3_THEME"') -- for GTK3 apps
hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"') -- for GTK4 apps
hl.exec_cmd("wl-gammarelay")
-- hl.env("QT_QPA_PLATFORMTHEME", "qt6ct") -- for Qt apps
