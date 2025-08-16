return {
  "vuki656/package-info.nvim",
  -- lazy = true,
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- local colors = require("catppuccin.palettes").get_palette("mocha")
    local colors = require("gruvbox")

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
  end,
}
