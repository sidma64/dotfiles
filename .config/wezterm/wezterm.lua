local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Spawn a fish shell in login mode
config.default_prog = { '/bin/bash', '-l' }

config.font = wezterm.font_with_fallback({
  -- "Terminus",
  -- "Cascadia Code",
  -- { family = "Fira Code" },
  -- "Red Hat Mono",
  -- "Overpass Mono",
  -- { family = "Victor Mono", weight = "Bold"},
  -- { family = "IBM Plex Mono" },
  -- { family = "Iosevka Term", stretch = "Expanded", weight = "Regular" },
  -- {family = "Consolas", weight = "Regular"},
  -- { family = "Source Code Pro" },
  "JetBrains Mono",
})

config.use_resize_increments = true

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Ligatures: ->, =>, ==, ===, :=, !=, !==, >=, <=, =====>, <======, <------, |>
config.keys = {
  {
    key = "F11",
    action = wezterm.action.ToggleFullScreen,
  },
}

-- local function get_appearance()
--   if wezterm.gui then
--     return wezterm.gui.get_appearance()
--   end
--   return 'Dark'
-- end

-- local function scheme_for_appearance(appearance)
--   if appearance:find 'Dark' then
--     return 'Gruvbox light, soft (base16)'
--   else
--     return 'Gruvbox light, soft (base16)'
--   end
-- end
config.color_scheme = "Gruvbox Material (Gogh)"

config.hide_tab_bar_if_only_one_tab = true

config.enable_wayland = false

config.native_macos_fullscreen_mode = true

config.tab_bar_at_bottom = false

return config
