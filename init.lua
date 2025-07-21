-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.options")

-- helpers
-- local alpha = function()
--   return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
-- end

-- neovide settings
if vim.g.neovide then
  -- layout
  vim.g.transparency = 0.8
  vim.g.neovide_opacity = 0.4
  vim.g.neovide_window_blurred = true
  vim.g.neovide_padding_top = 7
  -- vim.g.neovide_background_color = "#0f1117" .. alpha()

  -- font
  vim.o.guifont = "JetBrainsMono Nerd Font Propo:h15:b"
  vim.api.nvim_set_hl(0, "Comment", { italic = true, bold = true, fg = "#8787AE" })

  -- line spacing
  vim.o.linespace = 2

  -- cursor
  vim.g.neovide_cursor_hack = true
end
