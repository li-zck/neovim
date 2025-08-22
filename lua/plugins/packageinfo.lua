return {
  "vuki656/package-info.nvim",
  -- lazy = true,
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local colors = require("catppuccin.palettes").get_palette("mocha")
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    require("package-info").setup({
      package_manager = "pnpm",

      colors = {
        outdated = colors.yellow,
        up_to_date = colors.green,
        invalid = colors.red,
      },

      hide_up_to_date = true,

      timeout = 5000,
    })

    -- keybinds
    keymap("n", "<leader>cpt", function()
      require("package-info").toggle()
    end, vim.tbl_extend("force", opts, { desc = "Toggle package-info" }))

    keymap("n", "<leader>cpd", function()
      require("package-info").delete()
    end, vim.tbl_extend("force", opts, { desc = "Delete package" }))

    keymap("n", "<leader>cpi", function()
      require("package-info").install()
    end, vim.tbl_extend("force", opts, { desc = "Install package" }))

    keymap("n", "<leader>cpu", function()
      require("package-info").update()
    end, vim.tbl_extend("force", opts, { desc = "Update package" }))

    keymap("n", "<leader>cpc", function()
      require("package-info").change_version()
    end, vim.tbl_extend("force", opts, { desc = "Change package version" }))
  end,
}
