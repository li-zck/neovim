return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  keys = {
    {
      "<leader>zz",
      "<cmd>UndotreeToggle<cr>",
      desc = "Toggle Undotree",
    },
  },

  config = function()
    vim.g.undotree_WindowLayout = 4
    vim.g.undotree_SplitWidth = 30
    vim.g.undotree_ShortIndicators = 1

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "undotree",
      callback = function()
        vim.cmd("set noequalalways")
      end,
    })
  end,
}
