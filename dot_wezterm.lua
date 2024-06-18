-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font 'JetBrains Mono'
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.debug_key_events = true
config.disable_default_key_bindings = true
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  -- Reload configuration
  {
    mods   = 'CTRL',
    key    = 'r',
    action = wezterm.action.ReloadConfiguration,
  },

  -- Debug
  {
    mods   = 'CTRL',
    key    = 'd',
    action = wezterm.action.ShowDebugOverlay,
  },

  -- Windows/Sessions
  {
    mods   = 'LEADER',
    key    = 'w',
    action = wezterm.action.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for new workspace' },
      },
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:perform_action(
            wezterm.action.SwitchToWorkspace {
              name = line,
            },
            pane
          )
        end
      end),
    },
  },
  {
    mods   = 'LEADER',
    key    = 'q',
    action = wezterm.action.ShowLauncherArgs {
      flags = 'FUZZY|WORKSPACES',
    },
  },
  -- Closing a workspace is currently not possible, see:
  -- https://github.com/wez/wezterm/issues/3658

  -- Tabs
  {
    mods   = 'CTRL',
    key    = 't',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain'
  },
  {
    mods   = 'CTRL',
    key    = 'w',
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },
  {
    mods   = 'CTRL',
    key    = 'Tab',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    mods   = 'CTRL|SHIFT',
    key    = 'Tab',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    mods   = 'CTRL',
    key    = '1',
    action = wezterm.action.ActivateTab(0),
  },
  {
    mods   = 'CTRL',
    key    = '2',
    action = wezterm.action.ActivateTab(1),
  },
  {
    mods   = 'CTRL',
    key    = '3',
    action = wezterm.action.ActivateTab(2),
  },
  {
    mods   = 'CTRL',
    key    = '4',
    action = wezterm.action.ActivateTab(3),
  },
  {
    mods   = 'CTRL',
    key    = '5',
    action = wezterm.action.ActivateTab(4),
  },
  {
    mods   = 'CTRL',
    key    = '6',
    action = wezterm.action.ActivateTab(5),
  },
  {
    mods   = 'CTRL',
    key    = '7',
    action = wezterm.action.ActivateTab(6),
  },
  {
    mods   = 'CTRL',
    key    = '8',
    action = wezterm.action.ActivateTab(7),
  },
  {
    mods   = 'CTRL',
    key    = '9',
    action = wezterm.action.ActivateTab(8),
  },

  -- Panes
  {
    mods   = 'LEADER',
    key    = '-',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    mods   = 'LEADER',
    key    = '\\',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    mods   = 'LEADER',
    key    = 'x',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    mods   = 'LEADER',
    key    = 'z',
    action = wezterm.action.TogglePaneZoomState
  },
  {
    mods   = 'ALT',
    key    = 'h',
    action = wezterm.action.AdjustPaneSize { 'Left', 1 },
  },
  {
    mods   = 'ALT',
    key    = 'l',
    action = wezterm.action.AdjustPaneSize { 'Right', 1 },
  },
  {
    mods   = 'ALT',
    key    = 'j',
    action = wezterm.action.AdjustPaneSize { 'Down', 1 },
  },
  {
    mods   = 'ALT',
    key    = 'k',
    action = wezterm.action.AdjustPaneSize { 'Up', 1 },
  },
  {
    mods   = 'CTRL',
    key    = 'h',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    mods   = 'CTRL',
    key    = 'l',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    mods   = 'CTRL',
    key    = 'j',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    mods   = 'CTRL',
    key    = 'k',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },

  -- Copy & Paste
  {
    mods   = 'CTRL',
    key    = 'c',
    action = wezterm.action_callback(function(window, pane)
        selection_text = window:get_selection_text_for_pane(pane)
        is_selection_active = string.len(selection_text) ~= 0
        if is_selection_active then
            window:perform_action(wezterm.action.CopyTo('ClipboardAndPrimarySelection'), pane)
        else
            window:perform_action(wezterm.action.SendKey{ key='c', mods='CTRL' }, pane)
        end
    end),
  },
  {
    mods   = 'CTRL',
    key    = 'v',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
}

-- Wezterm / Tmux concept comparison:
-- session = workspace
-- window  = tab
-- pane    = pane

-- and finally, return the configuration to wezterm
return config