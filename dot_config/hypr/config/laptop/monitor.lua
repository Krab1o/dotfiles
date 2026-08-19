----------------
---- MONITORS ----
----------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

local monitor1 = "eDP-1"
local monitor2 = "HDMI-A-1"

-- base configuration
hl.monitor({ output = monitor1, mode = "1920x1080@60", position = "0x0",      scale = 1 })
hl.monitor({ output = monitor2, mode = "1920x1080@60", position = "1920x1080", scale = 1 })

-- for mirroring
-- hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "0x0", scale = 1 })
--
-- hl.monitor({ output = "HDMI-A-1", mode = "1920x1080", position = "1920x0", scale = 1, mirror = "eDP-1" })

------------------
----  WORKSPACES ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

for i = 1, 10 do
    hl.workspace_rule({ workspace = tostring(i), monitor = monitor1 })
end

for i = 11, 20 do
    hl.workspace_rule({ workspace = tostring(i), monitor = monitor2 })
end

local mainMod      = "SUPER"
local switchScript = "~/.config/hypr/script/toggle_scene.sh " .. monitor1 .. " " .. monitor2

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.exec_cmd(switchScript .. " " .. i))
end
