local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- go to next diagnostic
keymap("n", "<C-j>", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, opts)

-- go to next diagnostic
keymap("n", "<C-k>", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, opts)

-- NOTE: general keymaps
keymap("n", "<A-j>", ":m .+1<CR>==") -- move current line down (n)
keymap("n", "<A-k>", ":m .-2<CR>==") -- move current line up (n)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move current line down (v)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move current line up (v)

-- lspsaga
-- keymap("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
-- keymap("n", "<C-k>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>", opts)
keymap("n", "<C-c>d", "<cmd>Lspsaga peek_definition<CR>", opts)
-- keymap("n", "<C-c>k", "<cmd>Lspsaga hover_doc ++keep<CR>", opts)
keymap("n", "<C-c>f", "<cmd>Lspsaga finder<CR>", opts)
keymap("n", "<C-c>o", "<cmd>Lspsaga outline<CR>", opts)
keymap("n", "<C-c>r", "<cmd>Lspsaga rename<CR>", opts)

-- escape terminal mode
keymap("t", "<esc><esc>", "<c-\\><c-n>", opts)
