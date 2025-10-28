return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    -- "catppuccin",
  },

  -- event = "BufReadPre",

  -- init = function()
  --   local ok, bufline = pcall(require, "catppuccin.groups.integrations.bufferline")
  --   if ok and bufline.get_theme and not bufline.get then
  --     bufline.get = bufline.get_theme
  --   end
  -- end,

  opts = {
    options = {
      persist_buffer_sort = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = "slope",

      offsets = {
        {
          separator = false,
        },
      },

      -- groups = {
      --   items = {
      --     require("bufferline.groups").builtin.pinned:with({ icon = "🍣 " }),
      --   },
      -- },
    },
  },

  -- opts = function(_, opts)
  --   opts = opts or {}
  --   local ok, catpp_bufline = pcall(require, "catppuccin.groups.integrations.bufferline")
  --   if ok then
  --     local getter = catpp_bufline.get or catpp_bufline.get_theme
  --     if type(getter) == "function" then
  --       opts.highlights = getter()
  --     end
  --   end
  --
  --   opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
  --     options = {
  --       show_buffer_close_icons = false,
  --       show_close_icon = false,
  --     },
  --   })
  --
  --   return opts
  -- end,
}
