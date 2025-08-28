return {
  "axieax/urlview.nvim",
  opts = {
    vim.keymap.set("n", "\\u", "<cmd>UrlView<CR>", { desc = "View buffer urls" }),
  },
}
