return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      flavor = "macchiato", -- latte, frappe, macchiato, mocha
      background = {
        light = "latte",
        dark = "mocha",
      },
    },

    init = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
