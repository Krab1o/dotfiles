----------------
---- MONITORS ----
----------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- local monitor1 = "HDMI-A-1"
local monitor = "DP-1"
-- local monitor1 = "eDP-1"

-- base configuration
hl.monitor({
	output = monitor,
	mode = "2560x1440@240",
	position = "0x0",
	scale = 1,
})

-- hl.monitor({ output = monitor2, mode = "1920x1080@60", position = "1600x0", scale = 1 })

-- for mirroring
-- hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "0x0", scale = 1 })
--
-- hl.monitor({ output = "HDMI-A-1", mode = "1920x1080", position = "1920x0", scale = 1, mirror = "eDP-1" })

------------------
----  WORKSPACES ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

for i = 1, 10 do
	hl.workspace_rule({ workspace = tostring(i), monitor = monitor })
end

-- for i = 11, 20 do
--     hl.workspace_rule({ workspace = tostring(i), monitor = monitor2 })
-- end

local mainMod = "SUPER"
local switchScript = "~/.config/hypr/script/toggle_scene.sh " .. monitor

-- Switch workspaces with mainMod + [0-9]
-- FOR MULTI MONITOR
-- for i = 1, 10 do
--     local key = i % 10
--     hl.bind(mainMod .. " + " .. key, hl.dsp.exec_cmd(switchScript .. " " .. monitor2 .. " " .. i))
-- end

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
end
