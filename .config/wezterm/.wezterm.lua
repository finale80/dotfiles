-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- Use the defaults as a base
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- or, changing the font size and color scheme.
config.font_size = 12
config.color_scheme = 'Catppuccin Macchiato'

-- wsl
config.wsl_domains = wezterm.default_wsl_domains()
config.default_domain = 'WSL:Ubuntu-24.04'

-- launch menu
config.launch_menu = {
  {
    label = 'Command prompt',
    args = { '/mnt/c/windows/system32/cmd.exe' },
  },
}


--
-- plugins
--

-- tab bar
-- local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
-- bar.apply_to_config(
--    config,
--    {
--       modules = {
--           position = 'top',
-- 	  workspace = {
-- 	     enabled = false,
-- 	  }
--       }
--    }
-- )
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
  options = {
    icons_enabled = true,
    theme = 'Catppuccin Mocha',
    tabs_enabled = true,
    theme_overrides = {},
    section_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
    component_separators = {
      left = wezterm.nerdfonts.pl_left_soft_divider,
      right = wezterm.nerdfonts.pl_right_soft_divider,
    },
    tab_separators = {
      left = wezterm.nerdfonts.pl_left_soft_divider,
      right = wezterm.nerdfonts.pl_right_soft_divider,
    },
  },
  sections = {
    tabline_a = { 'mode' },
    tabline_b = { 'workspace' },
    tabline_c = { ' ' },
    tab_active = {
      'tab',
      -- { 'parent', padding = 0 },
      -- '/',
      -- { 'cwd', padding = { left = 0, right = 1 } },
      -- { 'zoomed', padding = 0 },
    },
    tab_inactive = { 
        {'tab', padding = 0},
        '/',
        {'index', padding = 0},
        --{ 'cwd', padding = { left = 0, right = 1 } },
        -- { 'process', padding = { left = 0, right = 1 } } 
    },
    tabline_x = { 'ram', 'cpu' },
    tabline_y = { 'datetime', 'battery' },
    tabline_z = { 'domain' },
  },
  extensions = {},
})
tabline.apply_to_config(config)


-- key bindings
config.keys = {
  -- CTRL+l: launcher
  { key = 'l', mods = 'CTRL', action = wezterm.action.ShowLauncher },
  -- CTRL+t: change tab name
  {
    key = 't',
    mods = 'CTRL',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      initial_value = 'My Tab Name',
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  -- split pane 
  { key = '\\', mods = 'CTRL|ALT', action = wezterm.action.SplitHorizontal {}},
  { key = '-', mods = 'CTRL|ALT', action = wezterm.action.SplitVertical {}},
  -- move tab relative
  { key = 'h', mods = 'CTRL|ALT', action = act.MoveTabRelative(-1) },
  { key = 'l', mods = 'CTRL|ALT', action = act.MoveTabRelative(1) },
  --
  {
    key = 'w', mods = 'CTRL|ALT', action = wezterm.action.CloseCurrentTab { confirm = false },
  },
}

-- register keys to move tab to specific index
for i = 1, 8 do
  -- CTRL+ALT + number to move to that position
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CTRL|ALT',
    action = wezterm.action.MoveTab(i - 1),
  })
end

-- Finally, return the configuration to wezterm:
return config
