require("config.lazy")
require("config.options")

-- floating window
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })

-- disable spell checks globally
vim.o.spell = false

-- neovide settings
if vim.g.neovide then
  -- layout
  vim.g.transparency = 1
  vim.g.neovide_opacity = 1
  vim.g.neovide_window_blurred = false
  vim.g.neovide_padding_top = 7
  -- vim.g.neovide_background_color = "#0f1117" .. alpha()

  -- font
  vim.o.guifont = "JetBrainsMono Nerd Font Propo:h15:b"
  vim.api.nvim_set_hl(0, "Comment", { italic = true, bold = true, fg = "#8787AE" })

  -- line spacing
  vim.o.linespace = 2

  -- cursor
  -- vim.g.neovide_cursor_hack = true
  -- vim.g.neovide_cursor_animation_length = 0.15
  -- vim.g.neovide_cursor_short_animation_length = 0.04
  -- vim.g.neovide_cursor_trail_size = 1.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 2
  vim.g.neovide_cursor_vfx_mode = "pixiedust" -- @param: railgun, torpedo, pixiedust
  vim.g.neovide_cursor_vfx_opacity = 200
  vim.g.neovide_cursor_vfx_particle_density = 2
  vim.g.neovide_cursor_vfx_particle_speed = 10

  -- others
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e", fg = "#cdd6f4", blend = 0 })
  -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1e1e2e", fg = "#cdd6f4", blend = 0 })

  -- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#1e1e2e" })
  -- vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#1e1e2e", fg = "#89b4fa" })

  -- vim.o.termguicolors = true
  -- vim.o.cursorline = false
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#010100" })
end
