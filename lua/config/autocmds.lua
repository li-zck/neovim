-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", { clear = true })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = lsp_fmt_group,
--   callback = function()
--     local efm = vim.lsp.get_clients({ name = "efm" })
--
--     if vim.tbl_isempty(efm) then
--       return
--     end
--
--     vim.lsp.buf.format({ name = "efm", async = true })
--   end,
-- })

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     require("conform").format({ bufnr = args.buf })
--   end,
-- })

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.css", "*.scss", "*.html" },
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--   end,
-- })

-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = { "*.mdx" },
--   callback = function()
--     vim.bo.filetype = "mdx"
--   end,
-- })

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})

vim.api.nvim_create_autocmd("User", {
  pattern = "MarkviewAttach",
  callback = function(event)
    local data = event.data

    vim.print(data)
  end,
})

-- disable spell checking for txt and md filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "txt" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- disable formatting for markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.b.autoformat = false
  end,
})

-- vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "txt",
  callback = function()
    vim.opt_local.spell = false
  end,
})
