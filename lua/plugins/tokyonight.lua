return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    transparent = false,
    terminal_colors = true,
    styles = {
      floats = "transparent", -- transparent floating windows
      sidebars = "transparent",
      -- value is any valid attr-list value for `:help nvim_set_hl`
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
    },
    day_brightness = 0.3, -- for tokyonight-day variation only
    dim_inactive = false,
    lualine_bold = true,

    -- on_colors = function(colors)
    --   colors.hint = colors.orange
    --   colors.unused = "#ffffff"
    -- end,

    on_highlights = function(hl, c)
      -- optional: sample tweaks similar to your Catppuccin overrides
      hl.DiagnosticUnnecessary = { fg = "#808493" }
      hl.TabLineSel = { fg = c.magenta }
      hl.TabLine = { fg = c.purple }
      hl.CmpBorder = { fg = c.purple, bg = "NONE" }
      hl.Pmenu = { bg = "NONE" }
    end,
  },
}
