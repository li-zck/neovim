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
      -- optional: sample tweaks similar to your catppuccin overrides
      hl.diagnosticunnecessary = { fg = "#5C5C5C" }
      hl.tablinesel = { fg = c.magenta }
      hl.tabline = { fg = c.purple }
      hl.cmpborder = { fg = c.purple, bg = "none" }
      hl.pmenu = { bg = "none" }
    end,
  },
}
