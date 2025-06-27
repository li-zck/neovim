return {
  "nvim-neo-tree/neo-tree.nvim",
  -- opts = function(_, opts)
  --   opts.filesystem = opts.filesystem or {}
  --   opts.filesystem.filtered_items = {
  --     visible = true,
  --     hide_dotfiles = false,
  --     hide_gitignored = false,
  --     hide_hidden = false,
  --     hide_by_name = {
  --       ".git",
  --     },
  --   }
  -- end,
  require("neo-tree").setup({
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
        hide_by_name = {
          ".git",
        },
      },
    },
  }),
}
