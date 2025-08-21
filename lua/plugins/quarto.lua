return {
  "quarto-dev/quarto-nvim",
  lazy = false,
  dependencies = {
    "jmbuhr/otter.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = { "quarto", "markdown", "json", "python", "bash", "html" },
  config = function()
    local quarto = require("quarto")
    -- local quarto_runner = require("quarto.runner")
    local keymap = vim.keymap.set

    quarto.setup({
      debug = false,
      closePreviewOnExit = true,
      lspFeatures = {
        enabled = true,
        languages = { "r", "python", "rust" },
        chunks = "all",
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      keymap = {
        -- NOTE: setup your own keymaps:
        -- hover = "H",
        -- definition = "gdd",
        -- rename = "<leader>rn",
        -- references = "grr",
        -- format = "<leader>gff",
        keymap("n", "<leader>qp", quarto.quartoPreview, { silent = true, noremap = true }),
      },
      codeRunner = {
        enabled = true,
        default_method = "molten",
        ft_runners = { python = "molten" },
      },
    })

    -- quarto_runner.setup({
    --   keymap("n", "<leader>rc", quarto_runner.run_cell, { desc = "run cell", silent = true }),
    --   keymap("n", "<leader>ra", quarto_runner.run_above, { desc = "run cell and above", silent = true }),
    --   keymap("n", "<leader>rA", quarto_runner.run_all, { desc = "run all cells", silent = true }),
    --   keymap("n", "<leader>rl", quarto_runner.run_line, { desc = "run line", silent = true }),
    --   keymap("n", "<leader>RA", function()
    --     quarto_runner.run_all(true)
    --   end, { desc = "run all cells of all languages", silent = true }),
    --   keymap("v", "<leader>rv", quarto_runner.run_range, { desc = "run visual range", silent = true }),
    -- })
  end,
}
