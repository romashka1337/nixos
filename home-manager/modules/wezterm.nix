{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      -- Pull in the wezterm API
      local wezterm = require 'wezterm'

      -- This will hold the configuration.
      local config = wezterm.config_builder()

      -- This is where you actually apply your config choices

      config.automatically_reload_config = true

      config.color_scheme = 'Catppuccin Mocha'
      config.font = wezterm.font({
        family =  'JetBrains Mono',
        weight = 'Bold',
      })
      config.font_size = 12
      config.window_background_opacity = 0.85

      config.use_fancy_tab_bar = false
      config.tab_bar_at_bottom = true
      -- config.colors = {
      --   tab_bar = {
      --     active_tab = {
      --       underline = 'Single'
      --     }
      --   }
      -- }
      config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
      local act = wezterm.action

      config.keys = {
        { key = 'C', mods = 'LEADER', action = act.CopyTo 'Clipboard' },
        { key = 'V', mods = 'LEADER', action = act.PasteFrom 'Clipboard' },

        { key = '\\', mods = 'LEADER', action = act.SplitVertical{ domain = 'CurrentPaneDomain' } },
        { key = "|", mods = 'LEADER|SHIFT', action = act.SplitHorizontal{ domain = 'CurrentPaneDomain' } },

        { key = ')', mods = 'CTRL', action = act.ResetFontSize },
        { key = ')', mods = 'SHIFT|CTRL', action = act.ResetFontSize },
        { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
        { key = '+', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
        { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
        { key = '-', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
        { key = '-', mods = 'SUPER', action = act.DecreaseFontSize },
        { key = '0', mods = 'CTRL', action = act.ResetFontSize },
        { key = '0', mods = 'SHIFT|CTRL', action = act.ResetFontSize },
        { key = '0', mods = 'SUPER', action = act.ResetFontSize },

        { key = '1', mods = 'LEADER', action = act.ActivateTab(0) },
        { key = '2', mods = 'LEADER', action = act.ActivateTab(1) },
        { key = '3', mods = 'LEADER', action = act.ActivateTab(2) },
        { key = '4', mods = 'LEADER', action = act.ActivateTab(3) },
        { key = '5', mods = 'LEADER', action = act.ActivateTab(4) },
        { key = '6', mods = 'LEADER', action = act.ActivateTab(5) },
        { key = '7', mods = 'LEADER', action = act.ActivateTab(6) },
        { key = '8', mods = 'LEADER', action = act.ActivateTab(7) },
        { key = '9', mods = 'LEADER', action = act.ActivateTab(8) },
        { key = 'c', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },

        { key = 'q', mods = 'LEADER', action = act.CloseCurrentTab{ confirm = true } },

        { key = '[', mods = 'LEADER', action = act.ActivateCopyMode },


        { key = 'F', mods = 'CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
        { key = 'K', mods = 'CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
        { key = 'L', mods = 'CTRL', action = act.ShowDebugOverlay },
        { key = 'P', mods = 'CTRL', action = act.ActivateCommandPalette },
        { key = 'U', mods = 'CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
        { key = 'Z', mods = 'CTRL', action = act.TogglePaneZoomState },

      }

      config.key_tables = {
        copy_mode = {
          { key = 'u', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (-0.5) } },
          { key = 'd', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (0.5) } },

          { key = '$', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
          { key = '^', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLineContent' },
          { key = '$', mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
          { key = '^', mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },

          { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
          { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
          { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },
          { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },

          { key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },
          { key = 'e', mods = 'NONE', action = act.CopyMode 'MoveForwardWordEnd' },
          { key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },

          { key = 'v', mods = 'NONE', action = act.CopyMode{ SetSelectionMode = 'Cell' } },
          { key = 'v', mods = 'CTRL', action = act.CopyMode{ SetSelectionMode = 'Block' } },
          { key = 'v', mods = 'SHIFT', action = act.CopyMode{ SetSelectionMode = 'Line' } },

          { key = 'y', mods = 'NONE', action = act.Multiple{ { CopyTo =  'ClipboardAndPrimarySelection' }, { Multiple = { 'ScrollToBottom', { CopyMode =  'Close' } } } } },

          { key = 'G', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackBottom' },

          { key = 'Escape', mods = 'NONE', action = act.Multiple{ 'ScrollToBottom', { CopyMode =  'Close' } } },
        },

        search_mode = {
          { key = 'Enter', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
          { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
          { key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
          { key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
          { key = 'r', mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
          { key = 'u', mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
          { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },
          { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'NextMatchPage' },
          { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
          { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
        },

      }

      -- and finally, return the configuration to wezterm
      return config
    '';
  };
}
