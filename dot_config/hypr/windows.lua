-- WINDOWS --

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- hl.layer_rule({ name = "noanim-selection", match = { namespace = "selection" }, no_anim = true })

-- Basic popups
hl.window_rule({
    name  = "float popups 1",
    match = { title = "^(Open File|Save File|Save As|Preferences|Settings)$" },
    float = true,
})

hl.window_rule({
    name  = "float popups 2",
    match = { class = "^(wireplumber|blueman-manager|nm-connection-editor)$" },
    float = true,
})

hl.window_rule({
    name  = "float popups 3",
    match = { class = "^(org.gnome.*|org.kde.*)$", title = "^(Open|Save|Preferences|Settings)$" },
    float = true,
})

-- Librewolf
hl.window_rule({
    name  = "librewolf workspace",
    match = { class = "^(librewolf.*)$" },
    workspace = "1",
})

-- Kitty
hl.window_rule({
    name  = "kitty workspace",
    match = { class = "^(kitty.*)$" },
    workspace = "2",
})

-- Spotify
hl.window_rule({
    name  = "spotify workspace",
    match = { class = "^(Spotify.*)$" },
    workspace = "9",
})

-- Discord
hl.window_rule({
    name  = "discord workspace",
    match = { class = "^(discord.*)$" },
    workspace = "8",
})

-- Betterbird
hl.window_rule({
    name  = "betterbird workspace",
    match = { class = "^(eu.betterbird.Betterbird.*)$" },
    workspace = "6",
})

-- Obsidian
hl.window_rule({
    name  = "obsidian workspace",
    match = { class = "^(obsidian.*)$" },
    workspace = "3",
})

-- OBS
hl.window_rule({
    name  = "obs workspace",
    match = { class = "^(com.obsproject.Studio.*)$" },
    workspace = "9",
})

-- Postman
hl.window_rule({
    name  = "postman workspace",
    match = { class = "^(Postman.*)$" },
    workspace = "5",
})

hl.window_rule({
    name  = "throne workspace",
    match = { class = "^(Throne.*)$" },
    workspace = "8",
})

-- Thunar
hl.window_rule({
    name  = "thunar workspace",
    match = { class = "^(thunar.*)$" },
    workspace = "4",
})
hl.window_rule({
    name  = "thunar float 1",
    match = { class = "^(thunar.*)$" },
    -- title = "^(Rename.*)$",
    float = true,
})

hl.window_rule({
    name  = "thunar tile",
    match = { class = "^(thunar.*)$", title = "^(.*Thunar.*)$" },
    tile = true,
})

hl.window_rule({
    name  = "thunar float 2",
    match = { class = "^(org.gnome.*|org.kde.*)$", title = "^(Open|Save|Preferences|Settings)$" },
    float = true,
})

-- Steam
hl.window_rule({
    name  = "steam workspace",
    match = { class = "^(steam)$" },
    workspace = "6",
})
hl.window_rule({
    name  = "steam float settings",
    match = { class = "^(steam)$", title = "^(Steam Settings.*)$" },
    float = true,
})
hl.window_rule({
    name  = "steam float friend list",
    match = { class = "^(steam)$", title = "^(Friends List.*)$" },
    center = true,
    size   = { 1080, 640 },
    float  = true,
})

-- qBitTorrent
hl.window_rule({
    name  = "qbittorrent workspace",
    match = { class = "^(org.qbittorrent.qBittorrent)$" },
    workspace = "7",
})
hl.window_rule({
    name  = "qbittorrent float popups",
    match = { class = "^(org.qbittorrent.qBittorrent)$" },
    center = true,
    size   = { 1080, 640 },
    float  = true,
})
hl.window_rule({
    name  = "qbittorrent tile",
    match = { class = "^(org.qbittorrent.qBittorrent)$", title = "^(qBittorrent v5.2.1)$" },
    tile = true,
})

-- CoreTime
hl.window_rule({
    name  = "coretime float",
    match = { class = "^(cc.cubocore.CoreTime)$" },
    center = true,
    size   = { 1080, 640 },
    float  = true,
})

-- Volume Control
hl.window_rule({
    name  = "pavucontrol float",
    match = { class = "^(org.pulseaudio.pavucontrol)$" },
    center = true,
    size   = { 1080, 640 },
    float  = true,
})

-- Telegram
hl.window_rule({
    name  = "telegram windowrule",
    match = { class = "^(org.telegram.desktop|telegramdesktop)$" },
    workspace = "10",
})
hl.window_rule({
    name  = "telegram float",
    match = { class = "^(org.telegram.desktop|telegramdesktop)$", title = "^(Media viewer)$" },
    float = true,
})

-- Dbeaver
hl.window_rule({
    name  = "dbeaver workspace",
    match = { class = "^(DBeaver)$" },
    workspace = "6",
})
hl.window_rule({
    name  = "dbeaver float",
    match = { class = "^(DBeaver)$" },
    center = true,
    size   = { 1080, 640 },
    float  = true,
})

hl.window_rule({
    name  = "dbeaver tile",
    match = { class = "^(DBeaver)$", title = "^(DBeaver.*)$" },
    tile = true,
})

-- Ignore maximize requests from apps. You'll probably like this.
-- hl.window_rule({ name = "suppress-maximize-events", match = { class = ".*" }, suppress_event = "maximize" })

-- Fix some dragging issues with XWayland
-- hl.window_rule({
--     name  = "fix-xwayland-drags",
--     match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
--     no_focus = true,
-- })
