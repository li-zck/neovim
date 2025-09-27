return {
  "NStefan002/screenkey.nvim",
  lazy = false,
  version = "*",
  enabled = false,

  config = function(_, opts)
    require("screenkey").setup(opts)
    vim.api.nvim_create_autocmd("VimEnter", {
      group = vim.api.nvim_create_augroup("AutostartScreenkey", {}),
      command = "Screenkey toggle",
      desc = "Autostart Screenkey on VimEnter",
    })
  end,

  opts = {
    win_opts = {
      row = vim.o.lines - 2,
      col = vim.o.columns - 2,
      relative = "editor",
      anchor = "SE",
      width = 9,
      height = 1,
      border = "rounded",
      title = "",
      title_pos = "center",
      style = "minimal",
      focusable = false,
      noautocmd = true,
    },
    clear_after = 2,
    keys = {
      ["<leader>"] = " 🤨",
    },
  },
}
