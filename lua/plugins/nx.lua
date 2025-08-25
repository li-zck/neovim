return {
  {
    "Equilibris/nx.nvim",

    dependencies = {
      "nvim-telescope/telescope.nvim",
    },

    opts = {
      -- Base command to run all other nx commands, some other values may be:
      -- - `npm nx`
      -- - `yarn nx`
      -- - `pnpm nx`
      nx_cmd_root = "pnpm nx",
    },

    -- Plugin will load when you use these keys
    keys = {
      { "<leader>rnx", "<cmd>Telescope nx actions<CR>", desc = "nx actions" },
    },
  },
}
