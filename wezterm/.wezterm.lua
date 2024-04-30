local wezterm = require("wezterm")
local config = wezterm.config_builder()
local currentTheme = 1
local themes = { "Tokyo Night", "Alabaster" }

function GetTheme()
	local time = os.date("*t")

	if time.hour < 8 or time.hour > 19 then
		return themes[1]
	else
		return themes[2]
	end
end

wezterm.on("toggle-tabbar", function(window, _)
	local overrides = window:get_config_overrides() or {}
	if overrides.enable_tab_bar == false then
		overrides.enable_tab_bar = true
	else
		overrides.enable_tab_bar = false
	end
	window:set_config_overrides(overrides)
end)

wezterm.on("toggle-theme", function(window, _)
	local overrides = window:get_config_overrides() or {}
	currentTheme = currentTheme == #themes and 1 or currentTheme + 1
	overrides.color_scheme = themes[currentTheme]
	window:set_config_overrides(overrides)
end)

config.color_scheme = GetTheme()
config.window_padding = { top = 0, bottom = 0, right = 0, left = 0 }
config.font = wezterm.font({
	family = "JetBrains Mono",
	harfbuzz_features = {
		"calt=0",
		-- 'clig=0',
		-- 'liga=0'
		-- <> |=> ++ ->
		-- <!-- ~~> ->>
		-- /= <= ### |>
		--
		-- [||] :?> ::=
		-- :: ?? <+> ..
	},
})
config.font_size = 16.0
config.initial_rows = 20
config.initial_cols = 120
-- config.enable_scroll_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.use_fancy_tab_bar = false
config.adjust_window_size_when_changing_font_size = false

config.keys = {
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
	{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
	-- { key = "j",          mods = "CTRL",       action = wezterm.action.SendKey { key = "DownArrow" } },
	-- { key = "k",          mods = "CTRL",       action = wezterm.action.SendKey { key = "UpArrow" } },
	{ key = "p", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "n", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "U", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "W", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "h", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
	{ key = "T", mods = "CTRL|SHIFT|OPT", action = wezterm.action.EmitEvent("toggle-tabbar") },
	{ key = "T", mods = "CTRL|SHIFT", action = wezterm.action.EmitEvent("toggle-theme") },
}

return config
