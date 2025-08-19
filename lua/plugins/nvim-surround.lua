return {
  "kylechui/nvim-surround",
  version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      keymaps = {
        normal = "gsa",
        delete = "gsd",
        change = "gsc",
        visual = "gsa",
      },
      -- surrounds = {
      --   ['"'] = {
      --     add = { '"', '"' },
      --     find = function()
      --       return require("nvim-surround.config").get_selection({ motion = 'a"' })
      --     end,
      --     delete = "^(.)().-(.)()$",
      --     change = {
      --       target = '^"().-()()"$',
      --       replacement = function()
      --         return require("nvim-surround.config").get_input("Enter the new delimiter: ")
      --       end,
      --     },
      --   },
      -- },
    })
  end,
}
