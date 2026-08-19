---------------------
---- KEYBINDINGS ----
---------------------

-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local programs = require("programs")

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Resize mode
hl.bind(mainMod .. " + M", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	-- resize with hjkl
	hl.bind("h", hl.dsp.window.resize({ x = -20, y = 0, relative = true }))
	hl.bind("l", hl.dsp.window.resize({ x = 20, y = 0, relative = true }))
	hl.bind("k", hl.dsp.window.resize({ x = 0, y = -20, relative = true }))
	hl.bind("j", hl.dsp.window.resize({ x = 0, y = 20, relative = true }))
	-- exit resize mode
	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind("Return", hl.dsp.submap("reset"))
end)

hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(programs.terminal))
-- hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(programs.fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(programs.menuApps))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(programs.menuFileManager))
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd(programs.menuRunApps))
-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- dwindle
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(programs.browser))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(programs.hyprlock))
hl.bind("PRINT", hl.dsp.exec_cmd(programs.hyprshot))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(programs.clipboard))
-- hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(programs.toggleMonitor))

-- bind for "-" (dash)
hl.bind(mainMod .. " + code:20", hl.dsp.exec_cmd(programs.waybarRestart))

hl.bind(mainMod .. " + F9", hl.dsp.exit())
hl.bind(mainMod .. " + F10", hl.dsp.exec_cmd(programs.sunsetrDay))
hl.bind(mainMod .. " + F11", hl.dsp.exec_cmd(programs.sunsetrGeo))
hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd(programs.sunsetrManual))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

-- hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
-- hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
-- hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
-- hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Move active window to a workspace with mainMod + ALT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ workspace = "-10" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ workspace = "+10" }))

-- hl.bind("SUPER + SHIFT + h", hl.dsp.window.move({ monitor = "left" }))
-- hl.bind("SUPER + SHIFT + l", hl.dsp.window.move({ monitor = "right" }))

-- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "e+1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
