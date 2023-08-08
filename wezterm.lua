-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "github_dark"
		-- return "catppuccin-mocha"
	else
		return "github_light"
		-- return "catppuccin-latte"
	end
end

config.enable_tab_bar = false
config.font = wezterm.font("SFMono Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" }) -- (AKA: SF Mono) /Users/sethwright/Library/Fonts/SFMono Regular Nerd Font Complete.otf, CoreText
config.font_size = 13.0
config.line_height = 1.1
config.color_scheme_dirs = { "/Users/sethwright/dotfiles/wezterm-themes/" }
config.color_scheme = scheme_for_appearance(get_appearance())
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.keys = {
	{
		key = "]",
		mods = "SUPER",
		action = wezterm.action({
			SendString = "¬",
		}),
	},
	{
		key = "[",
		mods = "SUPER",
		action = wezterm.action({
			SendString = "˙",
		}),
	},
	{
		key = "z",
		mods = "SUPER",
		action = wezterm.action({
			SendString = "⌟",
		}),
	},
	{
		key = "n",
		mods = "SUPER",
		action = wezterm.action({
			SendString = "ç",
		}),
	},
	{
		key = "t",
		mods = "SUPER",
		action = wezterm.action({
			SendString = "ç",
		}),
	},
	{
		key = "w",
		mods = "SUPER",
		action = wezterm.action({
			SendString = "≈",
		}),
	},
	{
		key = "r",
		mods = "SUPER",
		action = wezterm.action({
			SendString = "÷",
		}),
	},
	{
		key = "\\",
		mods = "CMD",
		action = wezterm.action({
			SendString = "«",
		}),
	},
	{
		key = "F",
		mods = "CMD|SHIFT",
		action = wezterm.action.ToggleFullScreen,
	},
}

return config
