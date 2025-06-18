-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Go to next diagnostic
keymap("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- DAP keymaps
return {
  -- Debugger Commands (mostly align with LazyVim defaults)
  keymap("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>", { desc = "Debugger step into" }),
  keymap("n", "<leader>dj", "<cmd>lua require('dap').step_over()<CR>", { desc = "Debugger step over" }),
  keymap("n", "<leader>dk", "<cmd>lua require('dap').step_out()<CR>", { desc = "Debugger step out" }),
  keymap("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>", { desc = "Debugger continue" }),
  keymap("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" }),

  -- Custom: Set conditional breakpoint
  keymap(
    "n",
    "<leader>dd",
    "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
    { desc = "Debugger set conditional breakpoint" }
  ),

  keymap("n", "<leader>de", "<cmd>lua require('dap').terminate()<CR>", { desc = "Debugger reset" }),
  keymap("n", "<leader>dr", "<cmd>lua require('dap').run_last()<CR>", { desc = "Debugger run last" }),

  -- rustaceanvim specific command:
  -- !!! RESOLVED CONFLICT: changed from <leader>dt to <leader>dT !!!
  keymap("n", "<leader>dT", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "RustLsp testables" }),
  -- If you prefer <leader>rt, use:
  -- keymap("n", "<leader>rt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "RustLsp testables" }),
}
