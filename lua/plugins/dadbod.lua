return {
  "kristijanhusak/vim-dadbod-ui",
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end,
  opts = {
    winwidth = 100,
  },
  keys = {
    {
      "<leader>db",
      -- function()
      --   require("dbui").toggle()
      -- end,
      -- desc = "Toggle DBUI",
      -- "<cmd>Neotree Close<cr><cmd>tabnew<cr><bar><bar><cmd>DBUI<cr>",
      function()
        vim.cmd("Neotree close")
        vim.cmd("tabnew")
        vim.cmd("DBUI")
      end,
      desc = "Open DBUI in new tab",
    },
  },
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
  },
}
