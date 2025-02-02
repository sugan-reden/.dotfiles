-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply the config

-- | My colorscheme choices | --
-- config.color_scheme = "Catppuccin Frappe"
-- config.color_scheme = "Tokyo Night"
-- config.color_scheme = "Tokyo Night Moon"
-- config.color_scheme = "Tokyo Night Storm"
config.color_scheme = "Cloud (terminal.sexy)"
-- config.color_scheme = "Zenburn"

-- | My fonts | --
config.font = wezterm.font("M+1Code Nerd Font")

config.front_end = "OpenGL"
config.max_fps = 144
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 500

-- | Terminal Settings | --
-- Sets the terminal type
config.term = "xterm-256color" -- deactivated to test if fzf works
-- config.default_prog = { "pwsh.exe", "-NoLogo" }
-- config.default_prog = { "C:/msys64/msys2.exe" }

-- | Window Settings | --
config.window_background_opacity = 0.8
config.text_background_opacity = 0.9
config.prefer_egl = true
config.font_size = 14

-- I think this is padding of the window that is rendered inside the wezterm
-- window. (i.e. the neovim window)
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- | Tab Settings | --
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false

-- | Color Scheme Toggling | --
-- The following is an example taken from *Coding with Sphere*'s wezterm config.
-- As of now, it is only meant to serve as an example if this feature was ever to be desired in the future.
-- NOTE: Don't forget to enable the keymap below if enabling this back on.
--
--[[ wezterm.on("toggle-colorscheme", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if overrides.color_scheme == "Zenburn" then
		overrides.color_scheme = "Cloud (terminal sexy)"
	else
		overrides.color_scheme = "Zenburn"
	end
	window:set_config_overrides(overrides)
end) ]]

-- | Keymaps | --
config.keys = {
	--[[ {
		key = "E",
		mods = "CTRL|ALT|SHIFT",
		action = act.EmitEvent("toggle-colorscheme")
	}, ]]
	{
		key = "H",
		mods = "CTRL|SHIFT|ALT",
		action = act.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "V",
		mods = "CTRL|SHIFT|ALT",
		action = act.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},
	{
		key = "U",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "I",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "O",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "P",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "9",
		mods = "CTRL",
		action = act.PaneSelect,
	},
	{
		key = "L",
		mods = "CTRL|SHIFT",
		action = act.ShowDebugOverlay,
	},
	{
		key = "o",
		mods = "CTRL|ALT",
		-- Opacity Toggle
		action = wezterm.action_callback(function(window, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.window_background_opacity == 1.0 then
				overrides.window_background_opacity = 0.9
			else
				overrides.window_background_opacity = 1.0
			end
			window:set_config_overrides(overrides)
		end),
	},
	{
		key = "w",
		mods = "CTRL",
		action = act.CloseCurrentPane({ confirm = true }),
	},
}

-- | Color Adjustments | --
-- This following is also taken from Coding Sphere's config.
-- The modified colorscheme is this one.
-- config.color_scheme = "Cloud (terminal.sexy)"
config.colors = {
	background = "#0c0b0f",
	cursor_border = "#bea3c7",
	cursor_bg = "#bea3c7",

	tab_bar = {
		background = "#0c0b0f",
		active_tab = {
			bg_color = "#0c0b0f",
			fg_color = "#bea3c7",
			intensity = "Normal",
			-- underline = "None",
			-- italic = false,
			-- strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#0c0b0f",
			fg_color = "#f8f2f5",
			intensity = "Normal",
			-- underline = "None",
			-- italic = false,
			-- strikethrough = false,
		},
		new_tab = {
			bg_color = "0c0b0f",
			fg_color = "white",
		},
	},
}

config.window_frame = {
	font = wezterm.font({ family = "M+1Code Nerd Font", weight = "Regular" }),
	active_titlebar_bg = "#0c0b0f",
}

-- config.window_decorations = "NONE | RESIZE"
config.initial_cols = 120

-- and finally, return the configuration to wezterm
return config
