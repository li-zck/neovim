return {
  lazy = false,
  version = "*",
  "nvim-neorg/neorg",
  ft = "norg",
  cmd = "Neorg",
  priority = 30,
  config = function()
    -- require("neorg").setup({
    --   load = {
    --     ["core.defaults"] = {},
    --   },
    -- })
  end,
}
