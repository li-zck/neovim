return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  enabled = false,
  opts = {
    window = {
      width = 25,
    },
    hide_root_node = true,
    retain_hidden_root_indent = true,
    default_component_configs = {
      git_status = {
        symbols = {
          -- Change type
          -- NOTE: you can set any of these to an empty string to not show them
          added = "✚",
          deleted = "✖",
          modified = "",
          renamed = "",

          -- Status type
          untracked = "",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "",
        },
        align = "right",
      },
    },
  },
}
