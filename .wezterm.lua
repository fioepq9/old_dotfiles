local wezterm = require 'wezterm'
local act = wezterm.action

local HOME = os.getenv("HOME")
local NUSHELL = "/usr/local/bin/nu"

local M = {}

M.default_prog = { NUSHELL, "-l" }
M.default_cwd = HOME

M.color_scheme = "OneHalfDark"
M.font_size = 16

-- M.keys = {
--     -- Turn off the default CMD-m Hide action, allowing CMD-m to
--     -- be potentially recognized and handled by the tab
-- }
-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window)
  local name = window:active_key_table()
  if name then
    name = "TABLE: " .. name
  end
  window:set_right_status(name or "")
end)

M.leader = {key="x", mods="CTRL"}
M.keys = {
    -- CTRL+SHIFT+Space, followed by 'r' will put us in resize-pane
    -- mode until we cancel that mode.
    {key="r", mods="LEADER", action=act.ActivateKeyTable{
      name="resize_pane",
      one_shot=false,
    }},

    -- CTRL+SHIFT+Space, followed by 'a' will put us in activate-pane
    -- mode until we press some other key or until 1 second (1000ms)
    -- of time elapses
    {key="a", mods="LEADER", action=act.ActivateKeyTable{
      name="activate_pane",
      timeout_milliseconds=1000,
    }},
    {key="UpArrow", mods="SHIFT", action=act.ScrollByLine(-3)},
    {key="DownArrow", mods="SHIFT", action=act.ScrollByLine(3)},

    {key="-", mods="LEADER", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
	{key="\\", mods="LEADER", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="x", mods="LEADER", action=wezterm.action{CloseCurrentPane={confirm=true}}},
    {key="h", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Left"}},
    {key="j", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Up"}},
    {key="k", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Down"}},
    {key="l", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Right"}},

    {key="1", mods="LEADER", action=wezterm.action{ActivateTab=0}},
    {key="2", mods="LEADER", action=wezterm.action{ActivateTab=1}},
    {key="3", mods="LEADER", action=wezterm.action{ActivateTab=2}},
    {key="4", mods="LEADER", action=wezterm.action{ActivateTab=3}},
    {key="5", mods="LEADER", action=wezterm.action{ActivateTab=4}},
    {key="6", mods="LEADER", action=wezterm.action{ActivateTab=5}},
    {key="7", mods="LEADER", action=wezterm.action{ActivateTab=6}},
    {key="8", mods="LEADER", action=wezterm.action{ActivateTab=7}},
    {key="9", mods="LEADER", action=wezterm.action{ActivateTab=8}},

    {key="f", mods="LEADER", action="QuickSelect"},
}

M.key_tables = {
    -- Defines the keys that are active in our resize-pane mode.
    -- Since we're likely to want to make multiple adjustments,
    -- we made the activation one_shot=false. We therefore need
    -- to define a key assignment for getting out of this mode.
    -- 'resize_pane' here corresponds to the name="resize_pane" in
    -- the key assignments above.
    resize_pane = {
      {key="LeftArrow", action=act.AdjustPaneSize{"Left", 1}},
      {key="h",         action=act.AdjustPaneSize{"Left", 1}},

      {key="RightArrow", action=act.AdjustPaneSize{"Right", 1}},
      {key="l",          action=act.AdjustPaneSize{"Right", 1}},

      {key="UpArrow", action=act.AdjustPaneSize{"Up", 1}},
      {key="k",       action=act.AdjustPaneSize{"Up", 1}},

      {key="DownArrow", action=act.AdjustPaneSize{"Down", 1}},
      {key="j",         action=act.AdjustPaneSize{"Down", 1}},

      -- Cancel the mode by pressing escape
      {key="Escape", action="PopKeyTable"},

    },

    -- Defines the keys that are active in our activate-pane mode.
    -- 'activate_pane' here corresponds to the name="activate_pane" in
    -- the key assignments above.
    activate_pane = {
      {key="LeftArrow", action=act.ActivatePaneDirection("Left")},
      {key="h",         action=act.ActivatePaneDirection("Left")},

      {key="RightArrow", action=act.ActivatePaneDirection("Right")},
      {key="l",          action=act.ActivatePaneDirection("Right")},

      {key="UpArrow", action=act.ActivatePaneDirection("Up")},
      {key="k",       action=act.ActivatePaneDirection("Up")},

      {key="DownArrow", action=act.ActivatePaneDirection("Down")},
      {key="j",         action=act.ActivatePaneDirection("Down")},
    },
}


return M
