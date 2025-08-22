local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<C-j>", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, opts) -- go to next diagnostic

keymap("n", "<C-k>", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, opts) -- go to next diagnostic

-- NOTE: general keymaps
keymap("n", "<A-j>", ":m .+1<CR>==") -- move current line down (n)
keymap("n", "<A-k>", ":m .-2<CR>==") -- move current line up (n)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move current line down (v)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move current line up (v)
