return {
  "yardnsm/vim-import-cost",
  ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  config = function()
    vim.cmd([[let g:import_cost_show_notification = 0]])
    vim.cmd([[let g:import_cost_timeout = 1000]])
  end,
}
