return {
  -- CATPPUCCIN --
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   opts = {
  --     transparent_background = true,
  --     flavor = "frappe",
  --     background = {
  --       light = "latte",
  --       dark = "frappe",
  --     },
  --   },
  --
  --   init = function()
  --     vim.cmd.colorscheme("catppuccin")
  --   end,
  -- },

  -- ROSE-PINE --
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    config = function()
      require("rose-pine").setup({
        variant = "moon",
        dark_variant = "moon",
        styles = {
          transparency = true,
          bold = true,
          italic = true,
        },
        enable = {
          terminal = true,
          legacy_highlights = true,
          migrations = true,
        },
        groups = {
          border = "muted",
          link = "iris",
          panel = "surface",
          error = "love",
          hint = "iris",
          info = "foam",
          note = "pine",
          todo = "rose",
          warn = "gold",
          git_add = "foam",
          git_change = "rose",
          git_delete = "love",
          git_dirty = "rose",
          git_ignore = "muted",
          git_merge = "iris",
          git_rename = "pine",
          git_stage = "iris",
          git_text = "rose",
          git_untracked = "subtle",
          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },
        highlight_groups = {
          Normal = { bg = nil },
          NormalFloat = { bg = nil },
          SignColumn = { bg = nil },
          LineNr = { bg = nil },
          EndOfBuffer = { bg = nil },
        },
      })
      vim.cmd("colorscheme rose-pine-moon")
    end,
  },

  -- ELDRITCH --
  -- {
  --   "eldritch-theme/eldritch.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --     terminal_colors = true,
  --     styles = {
  --       comments = { italic = true },
  --       keywords = { italic = true },
  --       functions = {},
  --       variables = {},
  --       sidebars = "dark",
  --       floats = "dark",
  --     },
  --     on_highlights = function(highlights, colors)
  --       highlights.Normal = { bg = nil } -- Ensure main background is transparent
  --       highlights.NormalFloat = { bg = nil } -- Ensure floating windows are transparent
  --       highlights.SignColumn = { bg = nil } -- Ensure sign column is transparent
  --       highlights.LineNr = { bg = nil } -- Ensure line numbers are transparent
  --     end,
  --   },
  -- },
}
