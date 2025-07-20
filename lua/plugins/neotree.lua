return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      width = 30,
    },
  },
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
