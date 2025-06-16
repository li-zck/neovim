return {
  "NStefan002/screenkey.nvim",
  lazy = false,
  version = "*",
  win_opts = {
    style = "full",
  },
  config = function()
    -- require("screenkey").setup({
    --   font_size = 14,
    -- })
    vim.api.nvim_create_autocmd("VimEnter", {
      group = vim.api.nvim_create_augroup("AutostartScreenkey", {}),
      command = "Screenkey toggle",
      desc = "Autostart Screenkey on VimEnter",
    })
  end,

  hl_groups = {
    ["screenkey.hl.key"] = { fg = "#cba6f7", bold = true },
    ["screenkey.hl.map"] = { fg = "#f38ba8", bold = true },
    ["screenkey.hl.sep"] = { fg = "#a6e3a1", bold = true },
  },
}
