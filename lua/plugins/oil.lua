return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = true,

    columns = {
      "icon",
      "permissions",
      "size",
      "mtime",
    },

    buf_options = {
      buflisted = true,
      bufhidden = "hide",
    },

    view_options = {
      show_hidden = true,
    },

    float = {
      padding = 2,
    },

    -- keymaps = {
    --   ["q"] = { "actions.close", mode = "n" },
    -- },
  },

  config = function()
    local oil = require("oil")
    oil.setup()
    vim.keymap.set("n", "~", oil.toggle_float, {})
    -- vim.keymap.set("n", "q", oil.close, {})
  end,
}
